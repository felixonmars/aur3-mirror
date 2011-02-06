#!/bin/bash

file_given=false
asked_for_help=false

for arg in "$@"
do
  if [[ $arg != -* ]]
  then
    file_given=true
  fi
  if [[ $arg == -h ]]
  then
    asked_for_help=true
  fi
  if [[ $arg == --help ]]
  then
    asked_for_help=true
  fi
done

CLI_command=/usr/share/languagetool/LanguageTool.jar
GUI_command=/usr/share/languagetool/LanguageToolGUI.jar

if $asked_for_help
then
  echo "Command-line interface (CLI) help:"
  java -jar $CLI_command -h | sed "s/java de.danielnaber.languagetool.Main/languagetool/"
  echo "Graphical user interface (GUI) help:"
  java -jar $GUI_command -h | sed "s/java de.danielnaber.languagetool.gui.Main/languagetool/"
else
  if $file_given
  then
    java -jar $CLI_command "$@"
  else
    java -jar $GUI_command "$@"
  fi
fi

