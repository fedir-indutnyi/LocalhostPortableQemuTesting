q:
rem connect with putty and execute list of commands
q:\tools\PuTTYPortable\App\putty\pscp.exe -C -agent -P 10022 -pw oxboxes.org 'q:\qemu_windows\configureproxy.sh' osboxes@127.0.0.1:~ 
q:\tools\PuTTYPortable\App\putty\pscp.exe -C -agent -P 10022 -pw oxboxes.org 'q:\qemu_windows\configureapplications.sh' osboxes@127.0.0.1:~ 
rem q:\PuTTYPortable\App\putty\plink.exe -ssh osboxes@127.0.0.1 -P 10022 -pw oxboxes.org -m q:\configure_proxy.sh


pause