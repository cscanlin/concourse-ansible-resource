# Pull base image
# https://github.com/ansible/ansible/blob/devel/test/utils/docker/ubuntu1404/Dockerfile
FROM ansible/ansible:ubuntu1404

# Ansible upgrade
ADD requirements.txt /opt/
RUN pip install --upgrade --no-cache-dir -r /opt/requirements.txt

# Install tests
COPY tests/ /opt/resource/tests/

# install resource assets
COPY assets/ /opt/resource/
