/*
--- Security Users ---
Identities used by external services to integrate with Elastic.
*/

/*
Note on 'password_hash':

Password hashes stored in this file are secure, as Elastic uses bcrypt
to hash passwords by default. Provided that passwords are generated with 
60 characters & the full printable ASCII set + 10 bcrypt rounds, the keyspace
of one password is 3x what crytography considers computationally infeasible 
to brute-force with any current or foreseeable compute (128-bit keyspace).

For reference, a multi-GPU password cracking rig sustaining millions
of guesses/second in aggregate would still require a timeframe exceeding
the age of the universe to crack a single password hash taken from this file.

Benchmark: https://tutorials.technology/tutorials/hashcat-bcrypt-benchmark-rtx-4090-5090-2026.html
*/

# Vector Service Identity
resource "elasticstack_elasticsearch_security_user" "vector" {
    username = "vector"
    roles = [
        elasticstack_elasticsearch_security_role.log_aggregator.name,
        elasticstack_elasticsearch_security_role.metrics_aggregator.name
    ]

    password_hash = "$2b$10$IVF.IAVKu/mqgQAIdJHrs.tXFcvY/CqSLUjMzdJzWiLrSx8ANnJuy"

    metadata = jsonencode(merge({
        "app" = "vector"
    }, local.common_metadata))
}
