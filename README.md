# guiAppInDockerOnWindows
Small example shows how to run a gui-App inside docker on a Windows-host.

## Prerequisites
To forward the GUI to the Windows-host we need a X-server running on the host.

### Installing Xming
> Xming is the leading X Window System Server for Microsoft Windows.

http://www.straightrunning.com/XmingNotes/

1. Download a *Public Domain Release* from http://www.straightrunning.com/XmingNotes/, e.g. `Xming
Xming-mesa 6.9.0.31` from http://sourceforge.net/projects/xming/files/Xming-mesa/6.9.0.31/Xming-mesa-6-9-0-31-setup.exe/download
2. Install by following the installation-wizzard
3. After the installation **restart**

### Starting Xming
Start the `XLaunch` and adopt the following configuration for particular screens:

* **Select display Settings** Multiple Windows, Display Number: 0
* **Select to start Xming** Start no client
* **Specify parameter settings** Clipboard, No Access Control

## Start the docker container
We have to provide additional data to the run command of docker.

1. Get the docker container
```
docker pull handflucht/guiappindockeronwindows
```

2. Get the IP of the host

```
PS C:\> ipconfig

Windows-IP-Konfiguration

[...]

Drahtlos-LAN-Adapter WLAN:

   Verbindungsspezifisches DNS-Suffix: localdomain
   Verbindungslokale IPv6-Adresse  . : ...
   IPv4-Adresse  . . . . . . . . . . : 192.168.1.5
   Subnetzmaske  . . . . . . . . . . : ...
   Standardgateway . . . . . . . . . : ...
```

3. Start docker

```
docker run -ti --rm -e DISPLAY=$DISPLAY handflucht/guiappindockeronwindows
```

Now a new window will open showing Firefox running inside.

## Troubleshooting


```
Failed to connect to Mir: Failed to connect to server socket: No such file or directory
Unable to init server: Broadway display type not supported: 192.168.1.5:0
Error: cannot open display: 192.168.1.5:0
```

X-server is not running. Use the lauch-tool to configure the server correctly.
