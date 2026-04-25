@echo off
setlocal enabledelayedexpansion

REM Set the Docker Hub username
set "USERNAME=devmayank8"

REM Set the project and version and repository names
set "PROJECT=finvistanexus"
set "VERSION=6.0.0-SNAPSHOT"
set "REPOSITORY1=configserver"
set "REPOSITORY2=eurekaserver"
set "REPOSITORY3=accounts"
set "REPOSITORY4=loans"
set "REPOSITORY5=cards"
set "REPOSITORY6=message"
set "REPOSITORY7=gatewayserver"

REM Define an array of images
set images[1]=%USERNAME%/%PROJECT%-%REPOSITORY1%:%VERSION%
set images[2]=%USERNAME%/%PROJECT%-%REPOSITORY2%:%VERSION%
set images[3]=%USERNAME%/%PROJECT%-%REPOSITORY3%:%VERSION%
set images[4]=%USERNAME%/%PROJECT%-%REPOSITORY4%:%VERSION%
set images[5]=%USERNAME%/%PROJECT%-%REPOSITORY5%:%VERSION%
set images[6]=%USERNAME%/%PROJECT%-%REPOSITORY6%:%VERSION%
set images[7]=%USERNAME%/%PROJECT%-%REPOSITORY7%:%VERSION%

REM Loop through the images and push each one
for /L %%i in (1,1,7) do (
  echo Pushing !images[%%i]!
  docker push !images[%%i]!
)

echo All images have been pushed.
endlocal
