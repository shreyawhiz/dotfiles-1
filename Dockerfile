FROM ubuntu:trusty

ADD . /root/dotfiles

CMD bash -c /root/dotfiles/bootstrap.sh \
 && bash -c /root/dotfiles/init/apt.sh

 WORKDIR /root/dotfiles
