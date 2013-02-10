{-# OPTIONS -fno-warn-missing-signatures #-}
import XMonad
import XMonad.Config.Gnome
import XMonad.Util.EZConfig

main = xmonad $ gnomeConfig
    `additionalKeysP`
        [ ("M-S-q", spawn "pkill gnome-session")
        , ("M-f", spawn "nautilus --no-desktop ~/Downloads")
        , ("M-S-,", spawn "gnome-control-center") ]


