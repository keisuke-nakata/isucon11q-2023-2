source "$(dirname "$0")/config.sh"

set -eux

# result
# git branch ${RESULT_BRANCH}
# git checkout ${RESULT_BRANCH}
# mkdir -p ${RESULT_BASE_DIR}
# echo -e "|dt|score|commit id|change log|\n|--|--|--|--|" > ${RESULT_BASE_DIR}/summary.md
# git add ${REPO_ROOT_DIR}
# git commit -m "summary.md"
# git push origin ${RESULT_BRANCH}

readonly cmd="cd ${REPO_ROOT_DIR} && git checkout -b result --track origin/result"
$SSH $APPSERVER2_PRIVATE_IP $cmd
$SSH $APPSERVER3_PRIVATE_IP $cmd

# main
# git checkout ${RELEASE_BRANCH}
# git pull origin ${RELEASE_BRANCH}

# mkdir -p ${CONF_DIR}
# mkdir -p ${CONF_DIR}/sql
# touch ${CONF_DIR}/sql/.gitkeep
# mkdir -p ${CONF_DIR}/nginx
# touch ${CONF_DIR}/nginx/.gitkeep
# mkdir -p ${CONF_DIR}/memcached
# touch ${CONF_DIR}/memcached/.gitkeep

# cp ${MYSQL_CONF_DEST} ${MYSQL_CONF_SRC}
# cp ${NGINX_ROOT_CONF_DEST} ${NGINX_ROOT_CONF_SRC}
# cp ${NGINX_SITE_CONF_DEST} ${NGINX_SITE_CONF_SRC}
# # cp ${MEMCACHED_CONF_DEST} ${MEMCACHED_CONF_SRC}

# git add ${REPO_ROOT_DIR}
# git commit -m "conf"
# git push origin ${RELEASE_BRANCH}

# # pprof
# mkdir -p ${PPORF_DIR}
