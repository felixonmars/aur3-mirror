{-# OPTIONS -fno-warn-missing-signatures #-}
import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig

myConfig = gnomeConfig { modMask = mod4Mask }
    `additionalKeysP`
        [ ("M-S-q", spawn "gnome-session-quit --logout --no-prompt")
        , ("M-f", spawn "nautilus --no-desktop ~/Downloads")
        , ("M-S-,", spawn "gnome-control-center") ]

main = xmonad =<< xmobar myConfig
