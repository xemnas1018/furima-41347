#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
# デプロイエラー発生時は、８行目をコメントアウトし、10行目のコメントアウトを外しcommit＆プルリクエスト後再デプロイ
#DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:migrate:reset
