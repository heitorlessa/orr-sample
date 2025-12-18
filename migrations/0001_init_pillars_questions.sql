-- migrations/0001_init_pillars_questions.sql

-- +goose Up
create table pillars
(
    id            bigserial primary key,
    slug          text        not null unique,    -- e.g., PERF, OPS, etc.
    name          text        not null,
    description   text        not null default '',
    display_order int         not null default 0, -- allow template authors to order importance e.g., Security pillar first
    created_at    timestamptz not null default now(),
    updated_at    timestamptz not null default now()
);

create table questions
(
    id                bigserial primary key,
    pillar_id         bigint      not null references pillars (id) on delete cascade,

    pillar_order      int         not null,            -- allow template authors to order questions within a pillar, e.g., PERF-1, OPS-2
    title             text        not null,            -- actual assessment question

    reason_important  text        not null default '', -- gives clarity to users on why a question exists to begin with
    leading_practices text        not null default '', -- metadata to share practices typically followed (markdown)
    helpful_links     text        not null default '', -- metadata to share internal or external links (markdown)

    is_active         boolean     not null default true,

    created_at        timestamptz not null default now(),
    updated_at        timestamptz not null default now(),

    unique (pillar_id, pillar_order),
    check (pillar_order > 0)
);

create index questions_pillar_order_idx
    on questions (pillar_id, pillar_order);

create index questions_active_idx
    on questions (is_active) where is_active = true;

-- +goose Down
drop table if exists questions;
drop table if exists pillars;
