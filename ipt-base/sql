grant insert on probes.data to logsnorter@localhost identified by 'password';
grant select on probes.detail to logsnorter@localhost;
grant select on probes.encoding to logsnorter@localhost;
grant select,insert on probes.event to logsnorter@localhost;
grant insert on probes.icmphdr to logsnorter@localhost;
grant insert on probes.iphdr to logsnorter@localhost;
grant insert on probes.opt to logsnorter@localhost;
grant insert on probes.reference to logsnorter@localhost;
grant select,insert on probes.reference_system to logsnorter@localhost;
grant select on probes.schema to logsnorter@localhost;
grant select,insert on probes.sensor to logsnorter@localhost;
grant select,insert on probes.sig_class to logsnorter@localhost;
grant select,insert on probes.sig_reference to logsnorter@localhost;
grant select,insert on probes.signature to logsnorter@localhost;
grant insert on probes.tcphdr to logsnorter@localhost;
grant insert on probes.udphdr to logsnorter@localhost;
grant all privileges on probes.* to base@localhost identified by 'password';


CREATE TABLE acid_event   ( sid                 INT UNSIGNED NOT NULL,
                            cid                 INT UNSIGNED NOT NULL,
                            signature           INT UNSIGNED NOT NULL,
                            sig_name            VARCHAR(255),
                            sig_class_id        INT UNSIGNED,
                            sig_priority        INT UNSIGNED,
                            timestamp           DATETIME NOT NULL,
                            ip_src              INT UNSIGNED,
                            ip_dst              INT UNSIGNED,
                            ip_proto            INT,
                            layer4_sport        INT UNSIGNED,
                            layer4_dport        INT UNSIGNED,

                            PRIMARY KEY         (sid,cid),
                            INDEX               (signature),
                            INDEX               (sig_name),
                            INDEX               (sig_class_id),
                            INDEX               (sig_priority),
                            INDEX               (timestamp),
                            INDEX               (ip_src),
                            INDEX               (ip_dst),
                            INDEX               (ip_proto),
                            INDEX               (layer4_sport),
                            INDEX               (layer4_dport)
                          );


CREATE TABLE acid_ag      ( ag_id               INT           UNSIGNED NOT NULL AUTO_INCREMENT,
                            ag_name             VARCHAR(40),
                            ag_desc             TEXT,
                            ag_ctime            DATETIME,
                            ag_ltime            DATETIME,

                            PRIMARY KEY         (ag_id),
                            INDEX               (ag_id));

CREATE TABLE acid_ag_alert( ag_id               INT           UNSIGNED NOT NULL,
                            ag_sid              INT           UNSIGNED NOT NULL,
                            ag_cid              INT           UNSIGNED NOT NULL,

                            PRIMARY KEY         (ag_id, ag_sid, ag_cid),
                            INDEX               (ag_id),
                            INDEX               (ag_sid, ag_cid));

CREATE TABLE acid_ip_cache( ipc_ip                  INT           UNSIGNED NOT NULL,
                            ipc_fqdn                VARCHAR(50),
                            ipc_dns_timestamp       DATETIME,
                            ipc_whois               TEXT,
                            ipc_whois_timestamp     DATETIME,

                            PRIMARY KEY         (ipc_ip),
                            INDEX               (ipc_ip) );
grant select,insert,delete on probes.acid_ag to logsnorter@localhost;
grant select,insert,delete on probes.acid_ag_alert to logsnorter@localhost;
grant select,insert,update,delete on probes.acid_event to logsnorter@localhost;
grant select,insert,update,delete on probes.acid_ip_cache to logsnorter@localhost;
grant select,insert,delete on probes.data to logsnorter@localhost;
grant select on probes.detail to logsnorter@localhost;
grant select on probes.encoding to logsnorter@localhost;
grant select,insert,delete on probes.event to logsnorter@localhost;
grant select,insert,delete on probes.icmphdr to logsnorter@localhost;
grant select,insert,delete on probes.iphdr to logsnorter@localhost;
grant select,insert,delete on probes.opt to logsnorter@localhost;
grant select,insert,update,delete on probes.reference to logsnorter@localhost;
grant select,insert,update,delete on probes.reference_system to logsnorter@localhost;
grant select on probes.schema to logsnorter@localhost;
grant select,insert on probes.sensor to logsnorter@localhost;
grant select,insert,update,delete on probes.sig_class to logsnorter@localhost;
grant select,insert,update,delete on probes.sig_reference to logsnorter@localhost;
grant select,insert on probes.signature to logsnorter@localhost;
grant select,insert,delete on probes.tcphdr to logsnorter@localhost;
grant select,insert,delete on probes.udphdr to logsnorter@localhost;
