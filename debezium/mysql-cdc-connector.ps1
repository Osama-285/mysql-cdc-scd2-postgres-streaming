# Run Both commands one by one
$body = @{
    name = "mysql-cdc-connector"
    config = @{
        "connector.class" = "io.debezium.connector.mysql.MySqlConnector"
        "database.hostname" = "mysql-db"
        "database.port" = "3306"
        "database.user" = "debezium"
        "database.password" = "dbz"
        "database.server.id" = "184054"
        "database.server.name" = "mysql_server"
        "database.include.list" = "cdc_db"
        "include.schema.changes" = "true"
        "topic.prefix" = "cdc"
        "database.allowPublicKeyRetrieval" = "true"
        "database.ssl.mode" = "disabled"
        "schema.history.internal.kafka.bootstrap.servers" = "broker2:29094"
        "schema.history.internal.kafka.topic" = "schema-changes.cdc"
    }
} | ConvertTo-Json -Depth 10

Invoke-RestMethod -Method Post `
  -Uri http://localhost:8083/connectors `
  -ContentType "application/json" `
  -Body $body
