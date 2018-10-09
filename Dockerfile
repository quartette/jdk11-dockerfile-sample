FROM adoptopenjdk/openjdk11:alpine-slim

# 成果物のパス
# ARG ARCHIVE_PATH=app.jar

# ロケール設定
# locationを Asia/Tokyo にする
RUN apk --update add tzdata bash sudo && \
      cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
      apk del tzdata && \
      rm -rf /var/cache/apk/* && \
      mkdir -p /var/app/quartette && \
      mkdir -p /var/log/app

# 実行ユーザーを追加
RUN adduser -h /home/quartette -D quartette && \
      chown -R quartette:quartette /var/app/quartette && \
      chown -R quartette:quartette /var/log/app

# 成果物をコピー
USER quartette
WORKDIR /home/quartette
# COPY ${ARCHIVE_PATH} /home/quartette/
COPY policy/tools.policy /home/quartette/

# 8080ポート解放。RMIポート解放
EXPOSE 8080 1099
