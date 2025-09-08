FROM ethereum/client-go:stable

RUN mkdir -p /opt/gbt
WORKDIR /opt/gbt

COPY genesis.json /opt/gbt/genesis.json
COPY start-node.sh /opt/gbt/start-node.sh
RUN chmod +x /opt/gbt/start-node.sh

# Expose RPC/WebSocket ports
EXPOSE 9636 8546

CMD ["/opt/gbt/start-node.sh"]
