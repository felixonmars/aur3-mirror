#!/bin/bash
if [[ "$(qdbus org.kde.kwin /KWin org.kde.KWin.compositingActive)" = "true" ]] ; then
qdbus org.kde.kwin /KWin org.kde.KWin.toggleCompositing
fi
$1
if [[ "$(qdbus org.kde.kwin /KWin org.kde.KWin.compositingActive)" = "false" ]] ; then
qdbus org.kde.kwin /KWin org.kde.KWin.toggleCompositing
fi
exit
