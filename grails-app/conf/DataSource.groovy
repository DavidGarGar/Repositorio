dataSource {
    pooled = true
    driverClassName = "oracle.jdbc.driver.OracleDriver"
    username = "cfdweb"
    password = "cfdweb"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:hsqldb:mem:devDB"
            dialect = "org.hibernate.dialect.Oracle10gDialect"
            url = "jdbc:oracle:thin:@10.255.220.87:1636:rgp"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:mem:testDb"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:file:prodDb;shutdown=true"
        }
    }
}
