REM #Run this script to setup an environment the first time, once the VM has been created, you do not need to run this again

REM # Note: this process is necessary because vagrant tries to mount the shared disk before the cifs-utils package is installed
REM #            - vagrant up                      # creates VM, then fails at mount
REM #            - vagrant provision               # runs provision portions of Vagrantfile, forces loading of centos packages
REM #            - vagrant reload --provision      # usues  vagrant halt, vagrant up   this works becuase all is now well after the packages
REM #                                              # are installed in the centos VM           


REM #   Note: you will be asked for your loging and password twice, use your windows password  (no plm/ prefix needed)


REM # create new vm,   it will finally error out, with errors relating to mount
vagrant up


REM # this will install required packages
vagrant provision


REM # start up again, with packages installed
vagrant reload  --provision





# from now on, you will just need to run vagrant up, and all will be well

