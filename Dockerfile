FROM circleci/node:8.8.0-browsers

USER root

#
# rsync 3.1.1-3
#
RUN RSYNC_VER="3.1.1-3" \
 && apt-get -qq update \
 && apt-get install -y rsync=$RSYNC_VER

#
# Zulu OpenJDK 8.23.0.3
#
RUN ZULUJDK_VER="8.23.0.3" \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9 \
 && echo "deb http://repos.azulsystems.com/debian stable main" >> /etc/apt/sources.list.d/zulu.list \
 && apt-get -qq update \
 && apt-get -y install zulu-8=$ZULUJDK_VER \
 && rm -rf /var/lib/apt/lists/*

#
# Bazel 0.7.0
#
RUN BAZEL_VER="0.7.0" \
 && wget -q -O - https://bazel.build/bazel-release.pub.gpg | apt-key add - \
 && echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" > /etc/apt/sources.list.d/bazel.list \
 && apt-get -qq update \
 && apt-get install -y bazel=$BAZEL_VER \
 && rm -rf /var/lib/apt/lists/*

#
# Brotli compression 0.5.2+dfsg-2 (stable)
# Not available on backports so we have to pull from Debian 9
# See https://packages.debian.org/search?keywords=brotli
#
RUN BROTLI_VER="0.5.2+dfsg-2" \
 && echo "deb http://deb.debian.org/debian stretch main contrib" > /etc/apt/sources.list.d/stretch.list \
 && apt-get -qq update \
 && apt-get install -y --no-install-recommends brotli=$BROTLI_VER \
 && rm -rf /var/lib/apt/lists/*

USER circleci

SHELL ["/bin/bash"]
ENTRYPOINT ["/bin/bash"]
