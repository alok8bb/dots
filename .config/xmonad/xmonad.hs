-- Default 
import System.Exit
import XMonad 
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

-- EMWH 
import XMonad.Hooks.EwmhDesktops

-- XMobar
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Util.Loggers
import Graphics.X11.ExtraTypes.XF86
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Gaps

import Data.Monoid
import Data.Function

main :: IO ()
main = xmonad 
    . ewmhFullscreen 
    . ewmh 
    . withEasySB (statusBarProp "xmobar ~/.config/xmobar/xmobarrc" (pure myXmobarPP)) defToggleStrutsKey 
    $ myConfig 

myConfig = def 
    { modMask = mod4Mask    -- rebind Mod to Super Key
    , layoutHook = myLayout -- custom layout (can add/edit)
    , manageHook = myManageHook
    , terminal = "alacritty"
    , borderWidth = 2
    , normalBorderColor  = "#1F2335"
    , focusedBorderColor = "#02c49e"
    }

    `additionalKeysP`
    [ ("M-S-z", spawn "betterlockscreen -l dim")   -- lockscreen
    , ("M-<Return>", spawn "alacritty" )           -- FIXME: switch to terminal variable 
    , ("M-S-<Return>", spawn "firefox" )           -- launch browser 
    , ("M-<Space>", spawn "rofi -show drun")       -- application launcher
    , ("M-S-p", spawn "pcmanfm" )
    , ("M-S-o", spawn "obsidian" )
    , ("M-S-q", kill)                              -- kill focused window 
    , ("M-S-l", sendMessage NextLayout)              -- change layouts 
    , ("M-S-c", io (exitWith ExitSuccess))         -- exit xmonad
    , ("<Print>", spawn "flameshot gui")

    -- Audio and Brightness 
    , ("<XF86AudioMute>", spawn "pamixer -t")
    , ("<XF86AudioRaiseVolume>", spawn "pamixer -i 5 --allow-boost")
    , ("<XF86AudioLowerVolume>", spawn "pamixer -d 5 --allow-boost")
    , ("<XF86MonBrightnessUp>", spawn "light -A 5%")
    , ("<XF86MonBrightnessDown>", spawn "light -U 5%")
    ]

myManageHook :: ManageHook 
myManageHook = composeAll 
    [ resource =? "desktop_window"  --> doIgnore
    , isDialog                      --> doFloat
    ]

myXmobarPP :: PP  
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Bottom" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""

myGaps              = [(U, 10), (D, 10), (L, 10), (R, 10)]

myLayout = tiled ||| Mirror tiled ||| Full -- &
        -- gaps myGaps 
    where
        tiled   = Tall nmaster delta ratio
        nmaster = 1         -- default number of windows in the master pane
        delta   = 3 / 100   -- percent of screen to increment by when resizing panes
        ratio   = 1 / 2     -- default proportion of screen occupied by master pane
