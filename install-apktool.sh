#!/usr/bin/env bash

# Get latest version from https://bitbucket.org/iBotPeaches/apktool/downloads

Version=2.11.1

# Refresh repositories
pkg update

depInstall () {
  if command -v nala &>/dev/null; then
    cmd="nala"
  else
    cmd="pkg"
  fi

  "$cmd" install "$1" -y
}

# Make sure wget is installed
if ! command -v wget &>/dev/null; then
  depInstall wget
fi

# Check if components exist. If not, fetch them.
if [[ ! -f "$PREFIX/bin/apktool.jar" ]]; then
  wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_${Version}.jar -O ./apktool.jar

  chmod +r ./apktool.jar

  mv ./apktool.jar "$PREFIX/bin/apktool.jar"
fi

if [[ ! -f "$PREFIX/bin/apktool" ]]; then
  wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O ./apktool

  chmod +x ./apktool

  mv ./apktool "$PREFIX/bin/apktool"
fi

# Make sure Java is installed
if ! command -v java &>/dev/null; then
  depInstall openjdk-17
fi
