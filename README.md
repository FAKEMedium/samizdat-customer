# Samizdat-Plugin-Customer

Customer entities, billing settings and services for [Samizdat](https://fakenews.com).
A **foundational** module: it ties the back-office together (its controller aggregates
invoice / hosting / domain / email data via helper-guarded calls), and its `customer`
database schema is referenced by many other dists (Certificate, Database, Website,
PayPal, Stripe, Swish, the core Mailer) — and it holds the invoice/payment tables.

**Required** for a working install with those modules; install it alongside core.
Extracted from the monorepo with history.

## Layout

    lib/Samizdat/Plugin/Customer.pm        routes + the `customer` helper
    lib/Samizdat/Controller/Customer.pm    request handlers
    lib/Samizdat/Model/Customer.pm         business logic / data access
    lib/Samizdat/resources/templates/customer/   views
    lib/Samizdat/resources/migrations/pg/30-customer/   the customer schema (tier 30)

## Dependencies

- **Samizdat** (core) — Account schema (FK target), pg/mysql, Cache, settings resolver.
- Mojolicious, Hash::Merge.

## Install

    perl Makefile.PL && make && make test    # core on PERL5LIB
    make install
