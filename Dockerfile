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

# install tests
#ADD scripts/* /tmp/
#RUN /tmp/install_test.sh

# test
#RUN /tmp/test.sh
#RUN /tmp/cleanup_test.sh

# default command: display local setup
CMD ["ansible", "-c", "local", "-m", "setup", "all"]
# CMD [ "ansible-playbook", "--version" ]
