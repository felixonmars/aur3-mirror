#! /bin/bash

if [ "$(whoami)" != "root" ]
then
    echo "Must be ran as root"
    exit 1
fi

export UT2004_PATH="/opt/ut2004"
    
# Find cabe files and extract game data.
# Must extract cabs from a single location.
is_more=y

while [ "$is_more" = "y" ]
do
    printf "Enter UT2004 disc mount-point: "
    read disc_mount

    if ! [ -d "$disc_mount" ]
    then
        echo "$disc_mount does not exist."
        continue
    fi 
    
    for f in $(find "$disc_mount" -name data[1-6].*)
    do
        cp -v "$f" /tmp 
    done

    echo
    printf "More discs [y/n]? "
    read is_more

    is_more="$(echo $is_more | tr [:upper:] [:lower:])"
done

for f in /tmp/data{1..6}
do
    unshield -d "$UT2004_PATH" -D2 x "$f" || exit 1
done

rm -vf /tmp/data[1-6].*

# Clean up directory structure.
mv -n "$UT2004_PATH"/All_Animations/*    "$UT2004_PATH"/Animations
mv -n "$UT2004_PATH"/All_Help/*          "$UT2004_PATH"/Help
mv -n "$UT2004_PATH"/All_Textures/*      "$UT2004_PATH"/Textures
mv -n "$UT2004_PATH"/All_Web/*           "$UT2004_PATH"/Web
mv -n "$UT2004_PATH"/All_Benchmark/*     "$UT2004_PATH"/Benchmark
mv -n "$UT2004_PATH"/All_ForceFeedback/* "$UT2004_PATH"/ForceFeedback
mv -n "$UT2004_PATH"/All_KarmaData/*     "$UT2004_PATH"/KarmaData
mv -n "$UT2004_PATH"/All_Maps/*          "$UT2004_PATH"/Maps
mv -n "$UT2004_PATH"/All_Music/*         "$UT2004_PATH"/Music
mv -n "$UT2004_PATH"/All_StaticMeshes/*  "$UT2004_PATH"/StaticMeshes
mv -n "$UT2004_PATH"/English_Sounds_Speech_System_Help/Sounds/* "$UT2004_PATH"/Sounds
mv -n "$UT2004_PATH"/English_Sounds_Speech_System_Help/Speech/* "$UT2004_PATH"/Speech
mv -n "$UT2004_PATH"/English_Sounds_Speech_System_Help/System/* "$UT2004_PATH"/System

rm -rf "$UT2004_PATH"/_*
rm -rf "$UT2004_PATH"/All_*
rm -rf "$UT2004_PATH"/English_Sounds_Speech_System_Help

# Install icon file.
install -D -m 644 "$UT2004_PATH"/Help/Unreal.ico \
    /usr/share/pixmaps/Unreal.ico

# Create CD key file.
echo
printf "Enter CD Key [XXXXX-XXXXX-XXXXX-XXXXX]: "
read cd_key

echo "$cd_key" > "$UT2004_PATH"/System/CDkey
