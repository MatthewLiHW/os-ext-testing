#!/bin/bash -xe

# Copyright (C) 2014 Hewlett-Packard Development Company, L.P.
#    All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
#
# See the License for the specific language governing permissions and
# limitations under the License.

cat >/etc/apt/apt.conf <<EOF
Acquire::http::Proxy \"$http_proxy\";
EOF

cat >>/etc/environment <<EOF
http_proxy=$http_proxy
https_proxy=$https_proxy
no_proxy=$no_proxy
EOF

cat >>/etc/profile <<EOF
export http_proxy=$http_proxy
export https_proxy=$https_proxy
export no_proxy=$no_proxy
EOF

mkdir -p ~/.pip/
cat >~/.pip/pip.conf <<EOF
[global]
proxy = $http_proxy
EOF
