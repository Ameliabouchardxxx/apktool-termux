#!/usr/bin/env bash

# Get latest version from https://bitbucket.org/iBotPeaches/apktool/downloads

Version=2.11.1

# Check if components exist. If not, fetch them.
if [[ ! -f "$PREFIX/bin/apktool.jar" ]]; then
  wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_${Version}.jar -O ./apktool.jar

  chmod +r ./apktool.jar

  mv ./apktool.jar $PREFIX/bin/apktool.jar
fi

if [[ ! -f "$PREFIX/bin/apktool" ]]; then
  wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O ./apktool

  chmod +x ./apktool

  mv ./apktool $PREFIX/bin/apktool
fi

# Install Java if not installed
if ! command -v java &>/dev/null; then
  # Use nala if it exists
  if command -v nala &>/dev/null; then
      nala update 
      nala install openjdk-17 -y
  else
      pkg update 
      pkg install openjdk-17 -y
  fi
fi
