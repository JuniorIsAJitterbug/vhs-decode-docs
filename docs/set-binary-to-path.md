# What is PATH 


What is `PATH` it just means an binary or application is available any ware on the system directly, on Linux this is common same for installed packages via package managers but for everything else this is still a manual task.


## MacOS and Linux (Command Line Interface)


Note: `${HOME}` is also known as `~`

Get familiar with macOS and Linux Environment Variables in Terminal

Open `Terminal`

Create directory `${HOME}/bin` by running

     mkdir -p ${HOME}/bin


Save the binary to directory `${HOME}/bin`

Make the binary executable by running

     chmod 755 ${HOME}/bin/binary


macOS specific step

Open your shell config file in a text editor. If the file doesn’t exist, create it


## Linux specific step


Open file `${HOME}/.bashrc` in a text editor. If the file doesn’t exist, create it
Add the below line to the shell config file, then save it

    export PATH="${HOME}/bin:${PATH}"

Restart your Terminal

Verify the binary is on your PATH by running

    command -v binary


## Windows CLI (Command Line Interface)


Get familiar with Windows Environment Variables in Command Prompt

Open `Command Prompt` or `CMD`

Create folder C:\bin by running

    mkdir C:\bin

Save the `binary.exe` to folder `C:\bin`

Edit the PATH for your account

    setx PATH "C:\bin;%PATH%"

Restart Command Prompt

Verify the binary.exe is on your PATH by running

    where.exe binary.exe


## Windows GUI


Create folder `C:\bin`

Save the `binary.exe` to folder `C:\bin`

Depending on your Windows version

If you’re using Windows 8 or 10, press the Windows key, then search for and select System (Control Panel)

If you’re using Windows 7, right click the Computer icon on the desktop and click Properties

Click Advanced system settings

Click Environment Variables

Under System Variables, find the PATH variable, select it, and click Edit. If there is no PATH variable, click New

Add `C:\bin` to the start of the variable value, followed by a ;. For example, if the value was 

`C:\Windows\System32` change it to `C:\bin;C:\Windows\System32`

Click OK

Open Command Prompt

Verify the binary.exe is on your PATH by running

    where.exe binary.exe