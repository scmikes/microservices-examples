
    # setup gradle
    # installs to /opt/gradle
# existing versions are not overwritten/deleted
# seamless upgrades/downgrades
# $GRADLE_HOME points to latest *installed* (not released)

yum install -y unzip
yum install -y wget

gradle_version=4.6

mkdir /opt/gradle
cd /opt/gradle
wget -N https://services.gradle.org/distributions/gradle-${gradle_version}-bin.zip

unzip gradle-${gradle_version}-bin.zip 
ln -sfn gradle-${gradle_version} /opt/gradle/latest
printf "export GRADLE_HOME=/opt/gradle/latest\nexport PATH=\$PATH:\$GRADLE_HOME/bin" > /etc/profile.d/gradle.sh
. /etc/profile.d/gradle.sh

rm gradle-${gradle_version}-bin.zip