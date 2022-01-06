# ---
# Kaspersky update utility 4.0
#ubuntu ver 
FROM ubuntu:21.10

LABEL maintainer="vaf@itzapad.ru"

# install soft
RUN apt-get update && apt-get -yq install cron && apt-get install vim -y && apt-get install wget -y

# setup working dir
WORKDIR /opt/kuu
RUN wget https://products.s.kaspersky-labs.com/special/kasp_updater3.0/4.1.0.474/english-4.1.0.474/3530393035317c44454c7c31/kuu4.1.0.474_x86_64_en.tar.gz  && tar xvzf kuu4.1.0.474_x86_64_en.tar.gz && rm kuu4.1.0.474_x86_64_en.tar.gz && rm /opt/kuu/updater.ini
#RUN rm /opt/kuu/updater.ini
COPY updater.ini /opt/kuu/updater.ini && kavupdater.sh /usr/bin/kavupdater.sh
# COPY kavupdater.sh /usr/bin/kavupdater.sh

# Giving executable permission to script file.
RUN chmod +x /usr/bin/kavupdater.sh && useradd -ms /bin/bash kladmin && chown -R kladmin:kladmin /opt/kuu/ && mkdir /opt/Updates && mkdir /opt/Temp && mkdir /opt/logs && chown -R kladmin:kladmin /opt/Updates && chown -R kladmin:kladmin /opt/Temp

# add new user
#RUN useradd -ms /bin/bash kladmin && chown -R kladmin:kladmin /opt/kuu/
# RUN chown -R kladmin:kladmin /opt/kuu/

# add folders for updates
# RUN mkdir /opt/Updates && mkdir /opt/Temp && mkdir /opt/logs
# RUN mkdir /opt/Temp
# RUN mkdir /opt/logs

# add persmittions
RUN chown -R kladmin:kladmin /opt/Updates && chown -R kladmin:kladmin /opt/Temp
# RUN chown -R kladmin:kladmin /opt/Temp

# setup cron
COPY kavupdater_cron /etc/cron.d/kavupdater_cron
RUN chmod 0644 /etc/cron.d/kavupdater_cron && crontab /etc/cron.d/kavupdater_cron && crontab /etc/cron.d/kavupdater_cron && touch /var/log/cron.log

# Apply cron job
# RUN crontab /etc/cron.d/kavupdater_cron
 
# Create the log file to be able to run tail
# RUN touch /var/log/cron.log

