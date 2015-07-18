# Remove guest login and hide users at login
# http://askubuntu.com/questions/451526/removing-guest-session-at-login-in-ubuntu-14-04
# http://www.tejasbarot.com/2014/04/25/hide-users-login-as-other-user-from-login-screen-ubuntu-14-04-lts-trusty-tahr/#axzz3fxfNQ1LU
sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\ngreeter-hide-users=true\n" > /usr/share/lightdm/lightdm.conf.d/50-no-guest.conf'
