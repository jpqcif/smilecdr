--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-2.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: FLY_CDR_MIGRATION; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FLY_CDR_MIGRATION" (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public."FLY_CDR_MIGRATION" OWNER TO postgres;

--
-- Name: ag_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ag_address (
    pid bigint NOT NULL,
    address_line1 character varying(200) NOT NULL,
    address_line2 character varying(200),
    city character varying(200) NOT NULL,
    country character varying(200) NOT NULL,
    postal_code character varying(200) NOT NULL,
    region character varying(200) NOT NULL,
    ag_profile_pid bigint
);


ALTER TABLE public.ag_address OWNER TO postgres;

--
-- Name: ag_appl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ag_appl (
    pid bigint NOT NULL,
    attestation_accepted boolean NOT NULL,
    confidential boolean,
    home_url character varying(200),
    launch_url character varying(200),
    long_desc character varying(1000) NOT NULL,
    app_name character varying(200) NOT NULL,
    oauth_redirect_url character varying(200) NOT NULL,
    privacy_policy_url character varying(200) NOT NULL,
    short_desc character varying(200) NOT NULL,
    ag_status character varying(20) NOT NULL,
    terms_of_service_url character varying(200) NOT NULL,
    version_number bigint,
    created_by character varying(200) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    last_modified_by character varying(200) NOT NULL,
    last_modified_date timestamp without time zone NOT NULL,
    identifier character varying(200),
    seed character varying(256),
    video_url character varying(200),
    video_url_status character varying(20),
    attestation_pid bigint,
    icon_pid bigint,
    module_pid bigint NOT NULL,
    oauth2_client_pid bigint,
    parent_pid bigint,
    profile_pid bigint,
    user_pid bigint
);


ALTER TABLE public.ag_appl OWNER TO postgres;

--
-- Name: ag_attestation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ag_attestation (
    pid bigint NOT NULL,
    archive_date timestamp without time zone,
    created_by character varying(200) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    last_modified_by character varying(200) NOT NULL,
    last_modified_date timestamp without time zone NOT NULL,
    title character varying(200) NOT NULL,
    html_pid bigint,
    module_pid bigint NOT NULL,
    plain_html_pid bigint
);


ALTER TABLE public.ag_attestation OWNER TO postgres;

--
-- Name: ag_class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ag_class (
    pid bigint NOT NULL,
    classification character varying(200) NOT NULL,
    ag_appl_pid bigint
);


ALTER TABLE public.ag_class OWNER TO postgres;

--
-- Name: ag_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ag_data (
    pid bigint NOT NULL,
    data_lob oid NOT NULL
);


ALTER TABLE public.ag_data OWNER TO postgres;

--
-- Name: ag_document; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ag_document (
    pid bigint NOT NULL,
    fileactive boolean NOT NULL,
    created_by character varying(200) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    last_modified_by character varying(200) NOT NULL,
    last_modified_date timestamp without time zone NOT NULL,
    filedesc character varying(200),
    filename character varying(200) NOT NULL,
    filetype character varying(200) NOT NULL,
    document_pid bigint NOT NULL,
    ag_appl_pid bigint
);


ALTER TABLE public.ag_document OWNER TO postgres;

--
-- Name: ag_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ag_note (
    pid bigint NOT NULL,
    created_by character varying(200) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    last_modified_by character varying(200) NOT NULL,
    last_modified_date timestamp without time zone NOT NULL,
    message character varying(1500) NOT NULL,
    reason character varying(1000) NOT NULL,
    note_type character varying(20),
    ag_appl_pid bigint
);


ALTER TABLE public.ag_note OWNER TO postgres;

--
-- Name: ag_oauth_redirect; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ag_oauth_redirect (
    pid bigint NOT NULL,
    oauth_redirect_url character varying(200) NOT NULL,
    ag_appl_pid bigint
);


ALTER TABLE public.ag_oauth_redirect OWNER TO postgres;

--
-- Name: ag_phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ag_phone (
    pid bigint NOT NULL,
    country_code character varying(20) NOT NULL,
    phone_number character varying(20) NOT NULL,
    phone_type character varying(20) NOT NULL,
    ag_profile_pid bigint
);


ALTER TABLE public.ag_phone OWNER TO postgres;

--
-- Name: ag_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ag_profile (
    pid bigint NOT NULL,
    archive_date timestamp without time zone,
    created_by character varying(200) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    last_modified_by character varying(200) NOT NULL,
    last_modified_date timestamp without time zone NOT NULL,
    business_name character varying(200),
    designation character varying(200),
    duns_number character varying(200),
    full_name character varying(200) NOT NULL,
    individual boolean NOT NULL,
    profile_type character varying(20),
    website_url character varying(200),
    module_pid bigint NOT NULL,
    user_pid bigint NOT NULL
);


ALTER TABLE public.ag_profile OWNER TO postgres;

--
-- Name: ag_sandbox_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ag_sandbox_client (
    pid bigint NOT NULL,
    seed character varying(256),
    module_pid bigint NOT NULL,
    oauth2_client_pid bigint NOT NULL,
    user_pid bigint NOT NULL
);


ALTER TABLE public.ag_sandbox_client OWNER TO postgres;

--
-- Name: ag_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ag_scope (
    pid bigint NOT NULL,
    scope character varying(200) NOT NULL,
    ag_appl_pid bigint
);


ALTER TABLE public.ag_scope OWNER TO postgres;

--
-- Name: ag_screenshot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ag_screenshot (
    pid bigint NOT NULL,
    filename character varying(200) NOT NULL,
    "position" integer,
    asset_status character varying(20) NOT NULL,
    screenshot_pid bigint NOT NULL,
    ag_appl_pid bigint
);


ALTER TABLE public.ag_screenshot OWNER TO postgres;

--
-- Name: cdr_audit_evt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_audit_evt (
    pid bigint NOT NULL,
    evt_additional_json oid,
    auser_type integer,
    have_headers boolean,
    remote_address character varying(100),
    source_transaction_id character varying(128),
    have_target_modules boolean NOT NULL,
    have_target_resources boolean NOT NULL,
    have_target_users boolean NOT NULL,
    evt_timestamp timestamp without time zone NOT NULL,
    type_display character varying(200) NOT NULL,
    user_pid bigint,
    client_pid bigint,
    endpoint_module_pid bigint NOT NULL,
    type_pid bigint NOT NULL
);


ALTER TABLE public.cdr_audit_evt OWNER TO postgres;

--
-- Name: cdr_audit_evt_header; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_audit_evt_header (
    pid bigint NOT NULL,
    evt_header_name character varying(100) NOT NULL,
    evt_header_value character varying(250),
    event_pid bigint NOT NULL
);


ALTER TABLE public.cdr_audit_evt_header OWNER TO postgres;

--
-- Name: cdr_audit_evt_target_module; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_audit_evt_target_module (
    pid bigint NOT NULL,
    event_pid bigint NOT NULL,
    module_pid bigint NOT NULL
);


ALTER TABLE public.cdr_audit_evt_target_module OWNER TO postgres;

--
-- Name: cdr_audit_evt_target_res; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_audit_evt_target_res (
    pid bigint NOT NULL,
    req_val_result integer,
    res_id character varying(120) NOT NULL,
    res_version bigint,
    res_version_str character varying(128),
    event_pid bigint NOT NULL,
    pers_module_pid bigint NOT NULL
);


ALTER TABLE public.cdr_audit_evt_target_res OWNER TO postgres;

--
-- Name: cdr_audit_evt_target_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_audit_evt_target_user (
    pid bigint NOT NULL,
    user_pid bigint NOT NULL,
    event_pid bigint NOT NULL
);


ALTER TABLE public.cdr_audit_evt_target_user OWNER TO postgres;

--
-- Name: cdr_audit_evt_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_audit_evt_type (
    pid bigint NOT NULL,
    codeval character varying(200),
    system_url character varying(200)
);


ALTER TABLE public.cdr_audit_evt_type OWNER TO postgres;

--
-- Name: cdr_cda_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_cda_template (
    pid bigint NOT NULL,
    template_description character varying(250),
    template_id character varying(250) NOT NULL,
    template_content oid NOT NULL,
    module_pid bigint NOT NULL
);


ALTER TABLE public.cdr_cda_template OWNER TO postgres;

--
-- Name: cdr_cda_template_param; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_cda_template_param (
    pid bigint NOT NULL,
    template_parameter_name character varying(250) NOT NULL,
    template_pid bigint
);


ALTER TABLE public.cdr_cda_template_param OWNER TO postgres;

--
-- Name: cdr_db_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_db_version (
    db_version character varying(100) NOT NULL,
    db_init_time timestamp without time zone NOT NULL
);


ALTER TABLE public.cdr_db_version OWNER TO postgres;

--
-- Name: cdr_fhir_searchparam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_fhir_searchparam (
    pid bigint NOT NULL,
    sp_base character varying(500) NOT NULL,
    sp_code character varying(500) NOT NULL,
    sp_desc character varying(500),
    sp_fhir_status character varying(255),
    last_updated timestamp without time zone NOT NULL,
    last_used timestamp without time zone,
    stat_overall_count bigint,
    sp_path character varying(500),
    stat_resource_spread double precision NOT NULL,
    sp_res_id character varying(150),
    sp_sync_status character varying(255) NOT NULL,
    sp_title character varying(500),
    sp_type character varying(20),
    buf_unique_resources oid,
    buf_unique_values oid,
    stat_value_spread double precision NOT NULL,
    module_pid bigint NOT NULL
);


ALTER TABLE public.cdr_fhir_searchparam OWNER TO postgres;

--
-- Name: cdr_global_gauge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_global_gauge (
    id character varying(200) NOT NULL,
    val_double double precision,
    val_long bigint
);


ALTER TABLE public.cdr_global_gauge OWNER TO postgres;

--
-- Name: cdr_http_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_http_session (
    pid bigint NOT NULL,
    ses_attrs oid NOT NULL,
    ses_expiry timestamp without time zone NOT NULL,
    last_accessed_time timestamp without time zone,
    max_inactive bigint NOT NULL,
    ses_id character varying(200) NOT NULL,
    module_pid bigint NOT NULL
);


ALTER TABLE public.cdr_http_session OWNER TO postgres;

--
-- Name: cdr_metric_gauge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_metric_gauge (
    gauge_type integer NOT NULL,
    intervl integer NOT NULL,
    start_time timestamp without time zone NOT NULL,
    is_collapsed boolean NOT NULL,
    gauge_val bigint NOT NULL,
    modproc_pid bigint NOT NULL
);


ALTER TABLE public.cdr_metric_gauge OWNER TO postgres;

--
-- Name: cdr_metric_hc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_metric_hc (
    pid bigint NOT NULL,
    error_string character varying(200),
    healthcheck_type integer NOT NULL,
    is_healthy boolean NOT NULL,
    healthy_string character varying(200),
    modproc_pid bigint NOT NULL
);


ALTER TABLE public.cdr_metric_hc OWNER TO postgres;

--
-- Name: cdr_metric_health; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_metric_health (
    pid bigint NOT NULL,
    custom_healthcheck_name character varying(256),
    error_string character varying(256),
    healthcheck_type integer NOT NULL,
    is_healthy boolean NOT NULL,
    healthy_string character varying(256),
    modproc_pid bigint NOT NULL
);


ALTER TABLE public.cdr_metric_health OWNER TO postgres;

--
-- Name: cdr_metric_timer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_metric_timer (
    intervl integer NOT NULL,
    start_time timestamp without time zone NOT NULL,
    timer_type integer NOT NULL,
    is_collapsed boolean NOT NULL,
    count_val bigint,
    rate_15_min real NOT NULL,
    first_since_rs boolean NOT NULL,
    rate_5_min real NOT NULL,
    latency_max integer NOT NULL,
    latency_mean integer NOT NULL,
    latency_min integer NOT NULL,
    modproc_pid bigint NOT NULL,
    rate_1_min real NOT NULL
);


ALTER TABLE public.cdr_metric_timer OWNER TO postgres;

--
-- Name: cdr_module; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_module (
    pid bigint NOT NULL,
    deleted boolean NOT NULL,
    module_disabled boolean NOT NULL,
    module_id character varying(50) NOT NULL,
    portval integer,
    node_pid bigint NOT NULL,
    prototype_pid bigint NOT NULL
);


ALTER TABLE public.cdr_module OWNER TO postgres;

--
-- Name: cdr_module_cfg_prop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_module_cfg_prop (
    pid bigint NOT NULL,
    value_string character varying(200),
    value_extended oid,
    module_pid bigint NOT NULL,
    prototype_pid bigint NOT NULL
);


ALTER TABLE public.cdr_module_cfg_prop OWNER TO postgres;

--
-- Name: cdr_module_dep; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_module_dep (
    pid bigint NOT NULL,
    module_pid bigint NOT NULL,
    prototype_pid bigint NOT NULL,
    target_pid bigint
);


ALTER TABLE public.cdr_module_dep OWNER TO postgres;

--
-- Name: cdr_module_process; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_module_process (
    pid bigint NOT NULL,
    first_mp boolean,
    module_pid bigint NOT NULL,
    nodeproc_pid bigint NOT NULL,
    restart_required boolean NOT NULL,
    module_status integer NOT NULL,
    module_status_desc character varying(200),
    status_timestamp timestamp without time zone
);


ALTER TABLE public.cdr_module_process OWNER TO postgres;

--
-- Name: cdr_module_prot_cfg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_module_prot_cfg (
    pid bigint NOT NULL,
    is_advanced boolean NOT NULL,
    category_key character varying(100) NOT NULL,
    default_value character varying(200),
    desc_key character varying(200),
    enum_type character varying(200),
    cfg_index integer NOT NULL,
    cfg_key character varying(200) NOT NULL,
    name_key character varying(200) NOT NULL,
    is_optional boolean NOT NULL,
    cfg_type character varying(100) NOT NULL,
    prototype_pid bigint NOT NULL
);


ALTER TABLE public.cdr_module_prot_cfg OWNER TO postgres;

--
-- Name: cdr_module_prot_dep; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_module_prot_dep (
    pid bigint NOT NULL,
    description_key character varying(200) NOT NULL,
    entry_key character varying(200) NOT NULL,
    prototype_pid bigint
);


ALTER TABLE public.cdr_module_prot_dep OWNER TO postgres;

--
-- Name: cdr_module_prot_supplies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_module_prot_supplies (
    pid bigint NOT NULL,
    entry_key integer NOT NULL,
    prototype_pid bigint
);


ALTER TABLE public.cdr_module_prot_supplies OWNER TO postgres;

--
-- Name: cdr_module_prototype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_module_prototype (
    pid bigint NOT NULL,
    module_type character varying(200) NOT NULL,
    stoppable boolean NOT NULL
);


ALTER TABLE public.cdr_module_prototype OWNER TO postgres;

--
-- Name: cdr_module_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_module_state (
    pid bigint NOT NULL,
    state_type integer NOT NULL,
    state_val character varying(200),
    module_pid bigint NOT NULL
);


ALTER TABLE public.cdr_module_state OWNER TO postgres;

--
-- Name: cdr_node; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_node (
    pid bigint NOT NULL,
    is_deleted boolean,
    node_id character varying(30) NOT NULL
);


ALTER TABLE public.cdr_node OWNER TO postgres;

--
-- Name: cdr_node_process; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_node_process (
    pid bigint NOT NULL,
    created_time timestamp without time zone NOT NULL,
    heartbeat_time timestamp without time zone,
    killed_by character varying(20),
    node_pid bigint NOT NULL,
    process_id character varying(20) NOT NULL,
    process_name character varying(100),
    started_time timestamp without time zone,
    node_status integer NOT NULL,
    stopped_time timestamp without time zone,
    opt_lock integer NOT NULL
);


ALTER TABLE public.cdr_node_process OWNER TO postgres;

--
-- Name: cdr_oa2_cli_det_auth_grnt_typ; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oa2_cli_det_auth_grnt_typ (
    pid bigint NOT NULL,
    grant_type character varying(100) NOT NULL,
    client_pid bigint NOT NULL
);


ALTER TABLE public.cdr_oa2_cli_det_auth_grnt_typ OWNER TO postgres;

--
-- Name: cdr_oa2_cli_det_autoap_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oa2_cli_det_autoap_scope (
    pid bigint NOT NULL,
    scope character varying(100) NOT NULL,
    client_pid bigint NOT NULL
);


ALTER TABLE public.cdr_oa2_cli_det_autoap_scope OWNER TO postgres;

--
-- Name: cdr_oa2_cli_det_autogrnt_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oa2_cli_det_autogrnt_scope (
    pid bigint NOT NULL,
    scope character varying(100) NOT NULL,
    client_pid bigint NOT NULL
);


ALTER TABLE public.cdr_oa2_cli_det_autogrnt_scope OWNER TO postgres;

--
-- Name: cdr_oa2_cli_det_clisec; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oa2_cli_det_clisec (
    pid bigint NOT NULL,
    sec_activation timestamp without time zone,
    sec_creation timestamp without time zone,
    sec_desc character varying(250),
    sec_expiration timestamp without time zone,
    cli_secret character varying(250) NOT NULL,
    client_pid bigint NOT NULL
);


ALTER TABLE public.cdr_oa2_cli_det_clisec OWNER TO postgres;

--
-- Name: cdr_oa2_cli_det_reg_redir_uri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oa2_cli_det_reg_redir_uri (
    pid bigint NOT NULL,
    redir_uri character varying(200) NOT NULL,
    client_pid bigint NOT NULL
);


ALTER TABLE public.cdr_oa2_cli_det_reg_redir_uri OWNER TO postgres;

--
-- Name: cdr_oa2_server; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oa2_server (
    pid bigint NOT NULL,
    auth_well_known_config_url character varying(500),
    custom_token_params character varying(500),
    federation_auth_script_text oid,
    federation_auth_url character varying(500),
    federation_jwks_url character varying(500),
    federation_reg_id character varying(500) NOT NULL,
    federation_req_scopes character varying(500),
    federation_token_url character varying(500),
    federation_user_info_url character varying(500),
    federation_user_mapping_text oid,
    fhir_endpoint_url character varying(500),
    iss character varying(200) NOT NULL,
    server_name character varying(200),
    notes character varying(1000),
    organization_id character varying(500),
    response_type character varying(500),
    intrspct_client_id character varying(200),
    intrspct_client_scrt character varying(200),
    jwks_file character varying(500),
    jwks_text oid,
    module_pid bigint NOT NULL
);


ALTER TABLE public.cdr_oa2_server OWNER TO postgres;

--
-- Name: cdr_oauth2_atoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oauth2_atoken (
    pid bigint NOT NULL,
    expiration timestamp without time zone NOT NULL,
    grant_type character varying(20),
    id_token_bytes oid,
    id_token_val character varying(1000),
    issued timestamp without time zone NOT NULL,
    redirect_uri character varying(200),
    token_hash character varying(150) NOT NULL,
    token_bytes oid,
    token_val character varying(1000),
    client_pid bigint NOT NULL,
    module_pid bigint NOT NULL,
    refresh_token_pid bigint,
    user_pid bigint
);


ALTER TABLE public.cdr_oauth2_atoken OWNER TO postgres;

--
-- Name: cdr_oauth2_atoken_adnlinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oauth2_atoken_adnlinfo (
    pid bigint NOT NULL,
    info_key character varying(200) NOT NULL,
    info_value character varying(200) NOT NULL,
    token_pid bigint NOT NULL
);


ALTER TABLE public.cdr_oauth2_atoken_adnlinfo OWNER TO postgres;

--
-- Name: cdr_oauth2_atoken_grntda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oauth2_atoken_grntda (
    pid bigint NOT NULL,
    perm_arg character varying(200),
    perm_name character varying(100) NOT NULL,
    token_pid bigint NOT NULL
);


ALTER TABLE public.cdr_oauth2_atoken_grntda OWNER TO postgres;

--
-- Name: cdr_oauth2_atoken_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oauth2_atoken_scope (
    pid bigint NOT NULL,
    scope character varying(100) NOT NULL,
    token_pid bigint NOT NULL
);


ALTER TABLE public.cdr_oauth2_atoken_scope OWNER TO postgres;

--
-- Name: cdr_oauth2_auth_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oauth2_auth_code (
    pid bigint NOT NULL,
    oauth2_authentication oid,
    client_id character varying(200) NOT NULL,
    code_val character varying(100) NOT NULL,
    expiration timestamp without time zone NOT NULL,
    pkce_challenge character varying(200),
    pkce_challenge_type character varying(10),
    state_val character varying(100)
);


ALTER TABLE public.cdr_oauth2_auth_code OWNER TO postgres;

--
-- Name: cdr_oauth2_client_det_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oauth2_client_det_scope (
    pid bigint NOT NULL,
    scope character varying(100) NOT NULL,
    client_pid bigint NOT NULL
);


ALTER TABLE public.cdr_oauth2_client_det_scope OWNER TO postgres;

--
-- Name: cdr_oauth2_client_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oauth2_client_details (
    pid bigint NOT NULL,
    access_token_validity_seconds integer,
    always_require_approval boolean,
    attestation_accepted boolean,
    can_introspect_any boolean,
    can_introspect_own boolean,
    can_reuse_tokens boolean,
    client_id character varying(200) NOT NULL,
    client_name character varying(200),
    client_secret character varying(200),
    enabled boolean,
    fixed_scope boolean NOT NULL,
    public_jwks oid,
    refresh_token_validity_seconds integer,
    remember_approved_scopes boolean,
    secret_client_can_change boolean,
    secret_required boolean NOT NULL,
    module_pid bigint
);


ALTER TABLE public.cdr_oauth2_client_details OWNER TO postgres;

--
-- Name: cdr_oauth2_client_perm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oauth2_client_perm (
    pid bigint NOT NULL,
    permission_type character varying(100) NOT NULL,
    permission_arg character varying(100),
    client_pid bigint NOT NULL
);


ALTER TABLE public.cdr_oauth2_client_perm OWNER TO postgres;

--
-- Name: cdr_oauth2_jwt_uniq_id; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oauth2_jwt_uniq_id (
    jwt_id character varying(500) NOT NULL,
    consumed_timestamp timestamp without time zone NOT NULL
);


ALTER TABLE public.cdr_oauth2_jwt_uniq_id OWNER TO postgres;

--
-- Name: cdr_oauth2_refresh_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oauth2_refresh_token (
    pid bigint NOT NULL,
    expiration timestamp without time zone,
    issued timestamp without time zone NOT NULL,
    token_val character varying(150) NOT NULL,
    client_pid bigint,
    user_pid bigint
);


ALTER TABLE public.cdr_oauth2_refresh_token OWNER TO postgres;

--
-- Name: cdr_oauth2_rtoken_adnlinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oauth2_rtoken_adnlinfo (
    pid bigint NOT NULL,
    info_key character varying(200) NOT NULL,
    info_value character varying(200) NOT NULL,
    token_pid bigint NOT NULL
);


ALTER TABLE public.cdr_oauth2_rtoken_adnlinfo OWNER TO postgres;

--
-- Name: cdr_oauth2_rtoken_grntda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oauth2_rtoken_grntda (
    pid bigint NOT NULL,
    perm_arg character varying(200),
    perm_name character varying(100) NOT NULL,
    token_pid bigint NOT NULL
);


ALTER TABLE public.cdr_oauth2_rtoken_grntda OWNER TO postgres;

--
-- Name: cdr_oauth2_rtoken_lnchresid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oauth2_rtoken_lnchresid (
    pid bigint NOT NULL,
    resource_id character varying(64) NOT NULL,
    resource_type character varying(50) NOT NULL,
    token_pid bigint NOT NULL
);


ALTER TABLE public.cdr_oauth2_rtoken_lnchresid OWNER TO postgres;

--
-- Name: cdr_oauth2_rtoken_reqprm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oauth2_rtoken_reqprm (
    pid bigint NOT NULL,
    parm_key character varying(200) NOT NULL,
    parm_value character varying(1600),
    token_pid bigint NOT NULL
);


ALTER TABLE public.cdr_oauth2_rtoken_reqprm OWNER TO postgres;

--
-- Name: cdr_oauth2_rtoken_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oauth2_rtoken_scope (
    pid bigint NOT NULL,
    scope character varying(100) NOT NULL,
    token_pid bigint NOT NULL
);


ALTER TABLE public.cdr_oauth2_rtoken_scope OWNER TO postgres;

--
-- Name: cdr_oauth2_rtoken_udata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_oauth2_rtoken_udata (
    token_pid bigint NOT NULL,
    token_key character varying(256) NOT NULL,
    val oid
);


ALTER TABLE public.cdr_oauth2_rtoken_udata OWNER TO postgres;

--
-- Name: cdr_user_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_user_details (
    pid bigint NOT NULL,
    is_anon_acct boolean,
    creds_expire_on timestamp without time zone,
    user_disabled boolean NOT NULL,
    email character varying(200),
    expires_on timestamp without time zone,
    is_external boolean,
    failed_login_attempts integer,
    family_name character varying(200),
    given_name character varying(200),
    last_active timestamp without time zone,
    user_locked boolean NOT NULL,
    module_pid bigint NOT NULL,
    notes oid,
    user_password character varying(200),
    is_service_acct boolean,
    is_system_user boolean NOT NULL,
    updated_ts timestamp without time zone NOT NULL,
    username character varying(200) NOT NULL,
    username_has_namespace boolean
);


ALTER TABLE public.cdr_user_details OWNER TO postgres;

--
-- Name: cdr_user_details_def_lnch_ctx; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_user_details_def_lnch_ctx (
    pid bigint NOT NULL,
    context_type character varying(50) NOT NULL,
    resource_id character varying(64) NOT NULL,
    user_pid bigint NOT NULL
);


ALTER TABLE public.cdr_user_details_def_lnch_ctx OWNER TO postgres;

--
-- Name: cdr_user_details_oa2clnaprvscp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_user_details_oa2clnaprvscp (
    pid bigint NOT NULL,
    is_approved boolean NOT NULL,
    scope character varying(100) NOT NULL,
    client_pid bigint NOT NULL,
    user_pid bigint NOT NULL
);


ALTER TABLE public.cdr_user_details_oa2clnaprvscp OWNER TO postgres;

--
-- Name: cdr_user_oa2cln_tos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_user_oa2cln_tos (
    pid bigint NOT NULL,
    created_by character varying(200) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    revoked_by character varying(200),
    revoked_date timestamp without time zone,
    version character varying(200) NOT NULL,
    client_pid bigint NOT NULL,
    user_pid bigint NOT NULL
);


ALTER TABLE public.cdr_user_oa2cln_tos OWNER TO postgres;

--
-- Name: cdr_user_perm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_user_perm (
    pid bigint NOT NULL,
    permission_type character varying(100) NOT NULL,
    permission_arg character varying(100),
    user_pid bigint
);


ALTER TABLE public.cdr_user_perm OWNER TO postgres;

--
-- Name: cdr_user_tfa_key; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_user_tfa_key (
    pid bigint NOT NULL,
    confirmed_at timestamp without time zone,
    key_expires timestamp without time zone,
    failed_verifs integer,
    a_key character varying(250) NOT NULL,
    a_style character varying(20) NOT NULL,
    optlock integer NOT NULL,
    user_pid bigint NOT NULL
);


ALTER TABLE public.cdr_user_tfa_key OWNER TO postgres;

--
-- Name: cdr_xact_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_xact_log (
    pid bigint NOT NULL,
    initial_timestamp timestamp without time zone NOT NULL,
    evt_outcome integer NOT NULL,
    src_xact_id character varying(128),
    evt_subtype integer NOT NULL,
    src_guid character varying(36),
    evt_type integer NOT NULL,
    user_pid bigint,
    client_pid bigint,
    cdr_endpoint_module_pid bigint
);


ALTER TABLE public.cdr_xact_log OWNER TO postgres;

--
-- Name: cdr_xact_log_step; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cdr_xact_log_step (
    step_pid bigint NOT NULL,
    body_bytes oid,
    body_type integer,
    local_host character varying(100),
    local_port integer,
    evt_outcome integer,
    processing_time bigint,
    remote_host character varying(100),
    remote_port integer,
    request_url_str character varying(250),
    req_val_result integer,
    request_verb character varying(7),
    response_status smallint,
    subscription_id character varying(77),
    log_timestamp timestamp without time zone NOT NULL,
    step_type integer NOT NULL,
    log_pid bigint NOT NULL
);


ALTER TABLE public.cdr_xact_log_step OWNER TO postgres;

--
-- Name: qrtz_blob_triggers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_blob_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    blob_data bytea
);


ALTER TABLE public.qrtz_blob_triggers OWNER TO postgres;

--
-- Name: qrtz_calendars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_calendars (
    sched_name character varying(120) NOT NULL,
    calendar_name character varying(200) NOT NULL,
    calendar bytea NOT NULL
);


ALTER TABLE public.qrtz_calendars OWNER TO postgres;

--
-- Name: qrtz_cron_triggers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_cron_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    cron_expression character varying(120) NOT NULL,
    time_zone_id character varying(80)
);


ALTER TABLE public.qrtz_cron_triggers OWNER TO postgres;

--
-- Name: qrtz_fired_triggers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_fired_triggers (
    sched_name character varying(120) NOT NULL,
    entry_id character varying(95) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    instance_name character varying(200) NOT NULL,
    fired_time bigint NOT NULL,
    sched_time bigint NOT NULL,
    priority integer NOT NULL,
    state character varying(16) NOT NULL,
    job_name character varying(200),
    job_group character varying(200),
    is_nonconcurrent boolean,
    requests_recovery boolean
);


ALTER TABLE public.qrtz_fired_triggers OWNER TO postgres;

--
-- Name: qrtz_job_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_job_details (
    sched_name character varying(120) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    job_class_name character varying(250) NOT NULL,
    is_durable boolean NOT NULL,
    is_nonconcurrent boolean NOT NULL,
    is_update_data boolean NOT NULL,
    requests_recovery boolean NOT NULL,
    job_data bytea
);


ALTER TABLE public.qrtz_job_details OWNER TO postgres;

--
-- Name: qrtz_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_locks (
    sched_name character varying(120) NOT NULL,
    lock_name character varying(40) NOT NULL
);


ALTER TABLE public.qrtz_locks OWNER TO postgres;

--
-- Name: qrtz_paused_trigger_grps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_paused_trigger_grps (
    sched_name character varying(120) NOT NULL,
    trigger_group character varying(200) NOT NULL
);


ALTER TABLE public.qrtz_paused_trigger_grps OWNER TO postgres;

--
-- Name: qrtz_scheduler_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_scheduler_state (
    sched_name character varying(120) NOT NULL,
    instance_name character varying(200) NOT NULL,
    last_checkin_time bigint NOT NULL,
    checkin_interval bigint NOT NULL
);


ALTER TABLE public.qrtz_scheduler_state OWNER TO postgres;

--
-- Name: qrtz_simple_triggers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_simple_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    repeat_count bigint NOT NULL,
    repeat_interval bigint NOT NULL,
    times_triggered bigint NOT NULL
);


ALTER TABLE public.qrtz_simple_triggers OWNER TO postgres;

--
-- Name: qrtz_simprop_triggers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_simprop_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    str_prop_1 character varying(512),
    str_prop_2 character varying(512),
    str_prop_3 character varying(512),
    int_prop_1 integer,
    int_prop_2 integer,
    long_prop_1 bigint,
    long_prop_2 bigint,
    dec_prop_1 numeric(13,4),
    dec_prop_2 numeric(13,4),
    bool_prop_1 boolean,
    bool_prop_2 boolean
);


ALTER TABLE public.qrtz_simprop_triggers OWNER TO postgres;

--
-- Name: qrtz_triggers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    next_fire_time bigint,
    prev_fire_time bigint,
    priority integer,
    trigger_state character varying(16) NOT NULL,
    trigger_type character varying(8) NOT NULL,
    start_time bigint NOT NULL,
    end_time bigint,
    calendar_name character varying(200),
    misfire_instr smallint,
    job_data bytea
);


ALTER TABLE public.qrtz_triggers OWNER TO postgres;

--
-- Name: seq_ag_address_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_ag_address_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_ag_address_pid OWNER TO postgres;

--
-- Name: seq_ag_appl_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_ag_appl_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_ag_appl_pid OWNER TO postgres;

--
-- Name: seq_ag_attestation_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_ag_attestation_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_ag_attestation_pid OWNER TO postgres;

--
-- Name: seq_ag_class_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_ag_class_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_ag_class_pid OWNER TO postgres;

--
-- Name: seq_ag_data_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_ag_data_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_ag_data_pid OWNER TO postgres;

--
-- Name: seq_ag_document_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_ag_document_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_ag_document_pid OWNER TO postgres;

--
-- Name: seq_ag_note_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_ag_note_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_ag_note_pid OWNER TO postgres;

--
-- Name: seq_ag_oauth_redirect_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_ag_oauth_redirect_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_ag_oauth_redirect_pid OWNER TO postgres;

--
-- Name: seq_ag_phone_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_ag_phone_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_ag_phone_pid OWNER TO postgres;

--
-- Name: seq_ag_profile_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_ag_profile_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_ag_profile_pid OWNER TO postgres;

--
-- Name: seq_ag_sandbox_client_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_ag_sandbox_client_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_ag_sandbox_client_pid OWNER TO postgres;

--
-- Name: seq_ag_scope_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_ag_scope_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_ag_scope_pid OWNER TO postgres;

--
-- Name: seq_ag_screenshot_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_ag_screenshot_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_ag_screenshot_pid OWNER TO postgres;

--
-- Name: seq_auditevt_header_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_auditevt_header_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_auditevt_header_pid OWNER TO postgres;

--
-- Name: seq_auditevt_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_auditevt_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_auditevt_pid OWNER TO postgres;

--
-- Name: seq_auditevt_targetmodule_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_auditevt_targetmodule_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_auditevt_targetmodule_pid OWNER TO postgres;

--
-- Name: seq_auditevt_targetres_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_auditevt_targetres_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_auditevt_targetres_pid OWNER TO postgres;

--
-- Name: seq_auditevt_targetuser_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_auditevt_targetuser_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_auditevt_targetuser_pid OWNER TO postgres;

--
-- Name: seq_auditevt_type_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_auditevt_type_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_auditevt_type_pid OWNER TO postgres;

--
-- Name: seq_cdatemplate_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_cdatemplate_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_cdatemplate_pid OWNER TO postgres;

--
-- Name: seq_cdatemplateparam_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_cdatemplateparam_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_cdatemplateparam_pid OWNER TO postgres;

--
-- Name: seq_fhirsearchparam_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_fhirsearchparam_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_fhirsearchparam_pid OWNER TO postgres;

--
-- Name: seq_httpsession_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_httpsession_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_httpsession_pid OWNER TO postgres;

--
-- Name: seq_metrichc_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_metrichc_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_metrichc_pid OWNER TO postgres;

--
-- Name: seq_metrichealth_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_metrichealth_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_metrichealth_pid OWNER TO postgres;

--
-- Name: seq_modproc_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_modproc_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_modproc_pid OWNER TO postgres;

--
-- Name: seq_modstat_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_modstat_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_modstat_pid OWNER TO postgres;

--
-- Name: seq_module_cfgprop_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_module_cfgprop_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_module_cfgprop_pid OWNER TO postgres;

--
-- Name: seq_module_dep_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_module_dep_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_module_dep_pid OWNER TO postgres;

--
-- Name: seq_module_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_module_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_module_pid OWNER TO postgres;

--
-- Name: seq_module_prot_cfg_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_module_prot_cfg_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_module_prot_cfg_pid OWNER TO postgres;

--
-- Name: seq_module_prot_dep_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_module_prot_dep_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_module_prot_dep_pid OWNER TO postgres;

--
-- Name: seq_module_prot_supplies_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_module_prot_supplies_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_module_prot_supplies_pid OWNER TO postgres;

--
-- Name: seq_module_prototype_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_module_prototype_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_module_prototype_pid OWNER TO postgres;

--
-- Name: seq_node_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_node_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_node_pid OWNER TO postgres;

--
-- Name: seq_nodeproc_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_nodeproc_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_nodeproc_pid OWNER TO postgres;

--
-- Name: seq_oa2atokadnlinfo_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2atokadnlinfo_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2atokadnlinfo_pid OWNER TO postgres;

--
-- Name: seq_oa2atoken_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2atoken_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2atoken_pid OWNER TO postgres;

--
-- Name: seq_oa2atokgrntda_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2atokgrntda_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2atokgrntda_pid OWNER TO postgres;

--
-- Name: seq_oa2atokscp_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2atokscp_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2atokscp_pid OWNER TO postgres;

--
-- Name: seq_oa2authcode_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2authcode_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2authcode_pid OWNER TO postgres;

--
-- Name: seq_oa2clidetaascop_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2clidetaascop_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2clidetaascop_pid OWNER TO postgres;

--
-- Name: seq_oa2clidetagscop_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2clidetagscop_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2clidetagscop_pid OWNER TO postgres;

--
-- Name: seq_oa2clidetauthgrnttyp_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2clidetauthgrnttyp_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2clidetauthgrnttyp_pid OWNER TO postgres;

--
-- Name: seq_oa2clidetclisec_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2clidetclisec_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2clidetclisec_pid OWNER TO postgres;

--
-- Name: seq_oa2clidetregrediruri_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2clidetregrediruri_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2clidetregrediruri_pid OWNER TO postgres;

--
-- Name: seq_oa2clientdetails_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2clientdetails_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2clientdetails_pid OWNER TO postgres;

--
-- Name: seq_oa2clientdetailsscope_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2clientdetailsscope_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2clientdetailsscope_pid OWNER TO postgres;

--
-- Name: seq_oa2clientperm_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2clientperm_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2clientperm_pid OWNER TO postgres;

--
-- Name: seq_oa2reftoken_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2reftoken_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2reftoken_pid OWNER TO postgres;

--
-- Name: seq_oa2rtokadnlinfo_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2rtokadnlinfo_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2rtokadnlinfo_pid OWNER TO postgres;

--
-- Name: seq_oa2rtokgrntda_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2rtokgrntda_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2rtokgrntda_pid OWNER TO postgres;

--
-- Name: seq_oa2rtoklnchresid_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2rtoklnchresid_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2rtoklnchresid_pid OWNER TO postgres;

--
-- Name: seq_oa2rtokreqprm_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2rtokreqprm_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2rtokreqprm_pid OWNER TO postgres;

--
-- Name: seq_oa2rtokscp_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2rtokscp_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2rtokscp_pid OWNER TO postgres;

--
-- Name: seq_oa2server_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_oa2server_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_oa2server_pid OWNER TO postgres;

--
-- Name: seq_user_oa2cln_tos_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_user_oa2cln_tos_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_user_oa2cln_tos_pid OWNER TO postgres;

--
-- Name: seq_user_perm_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_user_perm_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_user_perm_pid OWNER TO postgres;

--
-- Name: seq_user_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_user_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_user_pid OWNER TO postgres;

--
-- Name: seq_userdeflnchctx_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_userdeflnchctx_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_userdeflnchctx_pid OWNER TO postgres;

--
-- Name: seq_usertfakey_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_usertfakey_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_usertfakey_pid OWNER TO postgres;

--
-- Name: seq_usroa2clntaprvdscp_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_usroa2clntaprvdscp_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_usroa2clntaprvdscp_pid OWNER TO postgres;

--
-- Name: seq_xact_log_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_xact_log_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_xact_log_pid OWNER TO postgres;

--
-- Name: seq_xact_log_step_pid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_xact_log_step_pid
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_xact_log_step_pid OWNER TO postgres;

--
-- Data for Name: FLY_CDR_MIGRATION; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FLY_CDR_MIGRATION" (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	2018.09.20180901.0	Initialize schema for Smile CDR	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1208361284	postgres	2022-03-17 00:14:21.26986	1221	t
2	2018.09.20180918.1	Add table using raw sql	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	629294125	postgres	2022-03-17 00:14:21.289582	3	t
3	2018.09.20180918.2	Add table using raw sql	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1167194925	postgres	2022-03-17 00:14:21.302834	2	t
4	2018.09.20180918.3	Add table using raw sql	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1452862357	postgres	2022-03-17 00:14:21.316311	2	t
5	2018.09.20180918.4	Modify column USER_PID on table CDR_OAUTH2_ATOKEN	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-140758219	postgres	2022-03-17 00:14:21.327869	2	t
6	2018.09.20180918.5	Add table using raw sql	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1956578871	postgres	2022-03-17 00:14:21.339125	2	t
7	2018.09.20180918.6	Add column USER_PID on table CDR_OAUTH2_REFRESH_TOKEN	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1113877354	postgres	2022-03-17 00:14:21.351425	2	t
8	2018.09.20180918.7	Add IDX_OA2REFTOKEN_USER index to table CDR_OAUTH2_REFRESH_TOKEN	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1611043907	postgres	2022-03-17 00:14:21.363026	3	t
9	2018.09.20180918.8	Add column CLIENT_PID on table CDR_OAUTH2_REFRESH_TOKEN	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	765397142	postgres	2022-03-17 00:14:21.373827	2	t
10	2018.09.20180918.9	Add foreign key FK_OA2REFTOKEN_USER from column USER_PID of table CDR_OAUTH2_REFRESH_TOKEN to column PID of table CDR_USER_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1876294636	postgres	2022-03-17 00:14:21.384668	2	t
11	2018.09.20180918.10	Add foreign key FK_OA2REFTOKEN_CLIENT from column CLIENT_PID of table CDR_OAUTH2_REFRESH_TOKEN to column PID of table CDR_OAUTH2_CLIENT_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1285380228	postgres	2022-03-17 00:14:21.395046	2	t
12	2018.09.20180918.11	Add column REQUEST_URL_STR on table CDR_XACT_LOG_STEP	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1014448418	postgres	2022-03-17 00:14:21.405042	2	t
13	2018.09.20180918.12	Drop column REQUEST_URL from table CDR_XACT_LOG_STEP	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1703006594	postgres	2022-03-17 00:14:21.415298	2	t
14	2018.11.20181228.20	Add column SUBSCRIPTION_ID on table CDR_XACT_LOG_STEP	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1085182509	postgres	2022-03-17 00:14:21.425393	2	t
15	2019.02.20181221.1	Modify column USER_PID on table CDR_AUDIT_EVT	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1236528664	postgres	2022-03-17 00:14:21.434762	2	t
16	2019.02.20181221.2	Add column AUSER_TYPE on table CDR_AUDIT_EVT	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1219620671	postgres	2022-03-17 00:14:21.444339	2	t
17	2019.02.20181221.3	Add column CLIENT_PID on table CDR_AUDIT_EVT	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	642745832	postgres	2022-03-17 00:14:21.453786	2	t
18	2019.02.20181221.4	Add foreign key FK_AUDITEVT_CLIENT from column CLIENT_PID of table CDR_AUDIT_EVT to column PID of table CDR_OAUTH2_CLIENT_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-477672824	postgres	2022-03-17 00:14:21.462087	2	t
19	2019.02.20181221.5	Add column GRANT_TYPE on table CDR_OAUTH2_ATOKEN	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-300781724	postgres	2022-03-17 00:14:21.470894	2	t
20	2019.02.20181228.1	Add column REMEMBER_APPROVED_SCOPES on table CDR_OAUTH2_CLIENT_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1456993725	postgres	2022-03-17 00:14:21.479314	2	t
21	2019.02.20181228.2	Add table CDR_OA2_CLI_DET_AUTOGRNT_SCOPE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-964472990	postgres	2022-03-17 00:14:21.487829	2	t
22	2019.02.20181228.3	Add id generator SEQ_OA2CLIDETAGSCOP_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	32465099	postgres	2022-03-17 00:14:21.496123	2	t
23	2019.02.20181228.4	Add IDX_OA2CLIDETAGSCOPE_TOK_SCOP index to table CDR_OA2_CLI_DET_AUTOGRNT_SCOPE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	215707921	postgres	2022-03-17 00:14:21.505064	2	t
24	2019.02.20181228.5	Add foreign key FK_OA2CLIDETAUTOGRNTPSCOP_CLI from column CLIENT_PID of table CDR_OA2_CLI_DET_AUTOGRNT_SCOPE to column PID of table CDR_OAUTH2_CLIENT_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1008432355	postgres	2022-03-17 00:14:21.513271	2	t
25	2019.02.20181228.6	Add table CDR_USER_DETAILS_OA2CLNAPRVSCP	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	552001499	postgres	2022-03-17 00:14:21.521545	2	t
26	2019.02.20181228.7	Add id generator SEQ_USROA2CLNTAPRVDSCP_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	492311083	postgres	2022-03-17 00:14:21.529412	2	t
27	2019.02.20181228.8	Add IDX_USROA2CLNTAPRVDSCP_CLNTUSR index to table CDR_USER_DETAILS_OA2CLNAPRVSCP	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1208489234	postgres	2022-03-17 00:14:21.537667	2	t
28	2019.02.20181228.9	Add foreign key FK_USROA2CLNTAPRVDSCP_CLIENT from column CLIENT_PID of table CDR_USER_DETAILS_OA2CLNAPRVSCP to column PID of table CDR_OAUTH2_CLIENT_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-374405142	postgres	2022-03-17 00:14:21.545744	2	t
29	2019.02.20181228.10	Add foreign key FK_USROA2CLNTAPRVDSCP_USER from column USER_PID of table CDR_USER_DETAILS_OA2CLNAPRVSCP to column PID of table CDR_USER_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-356589950	postgres	2022-03-17 00:14:21.554299	2	t
30	2019.02.20181228.11	Add column SEC_DESC on table CDR_OA2_CLI_DET_CLISEC	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1940601071	postgres	2022-03-17 00:14:21.561871	2	t
31	2019.02.20181228.12	Add column SEC_CREATION on table CDR_OA2_CLI_DET_CLISEC	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1802337601	postgres	2022-03-17 00:14:21.570533	2	t
32	2019.02.20181228.13	Add id generator SEQ_OA2CLIENTPERM_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-580413572	postgres	2022-03-17 00:14:21.578094	2	t
33	2019.02.20181228.14	Add table CDR_OAUTH2_CLIENT_PERM	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-333449504	postgres	2022-03-17 00:14:21.585827	2	t
34	2019.02.20181228.15	Add foreign key FK_OA2CLIENTPERM_CLIENT from column CLIENT_PID of table CDR_OAUTH2_CLIENT_PERM to column PID of table CDR_OAUTH2_CLIENT_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1126531918	postgres	2022-03-17 00:14:21.593843	2	t
35	2019.02.20181228.16	Add column FULLTEXT_INDEXED_UNTIL on table CDR_MODULE_STATUS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1480182829	postgres	2022-03-17 00:14:21.601816	2	t
36	2019.02.20181228.17	Add column CONCEPTS_INDEXED_UNTIL on table CDR_MODULE_STATUS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-49039712	postgres	2022-03-17 00:14:21.609591	2	t
37	2019.02.20181228.18	Modify column SHORT_NAME on table CDR_MODULE_STATUS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	981738334	postgres	2022-03-17 00:14:21.616989	2	t
38	2019.02.20181228.19	Add column ENABLED on table CDR_OAUTH2_CLIENT_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	657017657	postgres	2022-03-17 00:14:21.62454	2	t
39	2019.05.20190219.1	Add id generator SEQ_OA2RTOKADNLINFO_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-523446226	postgres	2022-03-17 00:14:21.632151	2	t
40	2019.05.20190219.2	Add id generator SEQ_OA2RTOKGRNTDA_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1817713907	postgres	2022-03-17 00:14:21.639567	2	t
41	2019.05.20190219.3	Add id generator SEQ_OA2RTOKREQPRM_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	133015724	postgres	2022-03-17 00:14:21.64819	3	t
42	2019.05.20190219.4	Add id generator SEQ_OA2RTOKSCP_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1693490909	postgres	2022-03-17 00:14:21.657403	2	t
43	2019.05.20190219.5	Add table CDR_OAUTH2_RTOKEN_ADNLINFO	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	614686349	postgres	2022-03-17 00:14:21.664805	2	t
44	2019.05.20190219.6	Add IDX_OA2RTOKADLNF_RTOKEN_ADNLNF index to table CDR_OAUTH2_RTOKEN_ADNLINFO	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	776525966	postgres	2022-03-17 00:14:21.672084	1	t
45	2019.05.20190219.7	Add foreign key FK_OA2RTOKADNLINFO_TOKEN from column TOKEN_PID of table CDR_OAUTH2_RTOKEN_ADNLINFO to column PID of table CDR_OAUTH2_REFRESH_TOKEN	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1014982786	postgres	2022-03-17 00:14:21.679047	1	t
46	2019.05.20190219.8	Add table CDR_OAUTH2_RTOKEN_GRNTDA	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1760908223	postgres	2022-03-17 00:14:21.685728	1	t
47	2019.05.20190219.9	Add foreign key FK_OA2RTOKGRNTDA_TOKEN from column TOKEN_PID of table CDR_OAUTH2_RTOKEN_GRNTDA to column PID of table CDR_OAUTH2_REFRESH_TOKEN	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	770295608	postgres	2022-03-17 00:14:21.693012	2	t
48	2019.05.20190219.10	Add table CDR_OAUTH2_RTOKEN_REQPRM	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1586752707	postgres	2022-03-17 00:14:21.699913	1	t
49	2019.05.20190219.11	Add IDX_OA2RTOKREQPRM_RTOKEN_PARM index to table CDR_OAUTH2_RTOKEN_REQPRM	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1839976457	postgres	2022-03-17 00:14:21.707182	1	t
50	2019.05.20190219.12	Add foreign key FK_OA2RTOKREQPRM_TOKEN from column TOKEN_PID of table CDR_OAUTH2_RTOKEN_REQPRM to column PID of table CDR_OAUTH2_REFRESH_TOKEN	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1065681646	postgres	2022-03-17 00:14:21.7147	2	t
51	2019.05.20190219.13	Add table CDR_OAUTH2_RTOKEN_SCOPE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	2129497293	postgres	2022-03-17 00:14:21.721744	1	t
52	2019.05.20190219.14	Add IDX_OA2RTOKSCP_RTOKEN_SCOPE index to table CDR_OAUTH2_RTOKEN_SCOPE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1364587927	postgres	2022-03-17 00:14:21.72925	2	t
53	2019.05.20190219.15	Add foreign key FK_OA2RTOKSCP_TOKEN from column TOKEN_PID of table CDR_OAUTH2_RTOKEN_SCOPE to column PID of table CDR_OAUTH2_REFRESH_TOKEN	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	999705364	postgres	2022-03-17 00:14:21.736356	1	t
54	2019.05.20190219.16	Add IDX_OA2ATOKEN_USER index to table CDR_OAUTH2_ATOKEN	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1088716338	postgres	2022-03-17 00:14:21.744088	1	t
55	2019.05.20190404.1	Execute raw sql	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1456200313	postgres	2022-03-17 00:14:21.751242	1	t
56	2019.05.20190404.2	Execute raw sql	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-879045558	postgres	2022-03-17 00:14:21.757991	1	t
57	2019.05.20190404.3	Drop column SHORT_NAME from table CDR_MODULE_STATUS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1981358506	postgres	2022-03-17 00:14:21.764703	1	t
58	2019.05.20190404.4	Add column SECRET_CLIENT_CAN_CHANGE on table CDR_OAUTH2_CLIENT_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1821464944	postgres	2022-03-17 00:14:21.771566	1	t
59	2019.05.20190404.5	Add column CLIENT_PID on table CDR_XACT_LOG	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	2112133764	postgres	2022-03-17 00:14:21.778792	1	t
60	2019.05.20190404.6	Add foreign key FK_TRANSIT_CLIENT from column CLIENT_PID of table CDR_XACT_LOG to column PID of table CDR_OAUTH2_CLIENT_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-2029245563	postgres	2022-03-17 00:14:21.785765	1	t
61	2019.05.20190404.7	Add foreign key FK_TRANSIT_EVENT from column USER_PID of table CDR_XACT_LOG to column PID of table CDR_USER_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1637888312	postgres	2022-03-17 00:14:21.793209	1	t
62	2019.05.20190404.8	Add column IS_ANON_ACCT on table CDR_USER_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-294061151	postgres	2022-03-17 00:14:21.800313	2	t
63	2019.05.20190404.9	Add column SRC_XACT_ID on table CDR_XACT_LOG	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1594741575	postgres	2022-03-17 00:14:21.807379	1	t
64	2019.08.20190719.1	Rename column PORT to PORTVAL on table CDR_MODULE_STATUS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1045967505	postgres	2022-03-17 00:14:21.814486	1	t
65	2019.08.20190719.2	Rename column PASSWORD to USER_PASSWORD on table CDR_USER_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	233287007	postgres	2022-03-17 00:14:21.821167	1	t
66	2019.08.20190719.3	Rename column CODE to CODEVAL on table CDR_AUDIT_EVT_TYPE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-853200694	postgres	2022-03-17 00:14:21.828261	1	t
67	2019.08.20190719.4	Rename column SYSTEM to SYSTEM_URL on table CDR_AUDIT_EVT_TYPE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-599005281	postgres	2022-03-17 00:14:21.835373	1	t
68	2019.08.20190719.5	Rename column NAME to SERVER_NAME on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1959231739	postgres	2022-03-17 00:14:21.842591	2	t
69	2019.08.20190719.6	Rename column VALUE to VALUE_STRING on table CDR_MODULE_CFG_PROP	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-367535124	postgres	2022-03-17 00:14:21.84904	1	t
70	2019.08.20190719.7	Modify column REMOTE_ADDRESS on table CDR_AUDIT_EVT	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1275717139	postgres	2022-03-17 00:14:21.855767	1	t
71	2019.08.20190719.8	Modify column TEMPLATE_DESCRIPTION on table CDR_CDA_TEMPLATE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	804940837	postgres	2022-03-17 00:14:21.862297	1	t
72	2019.08.20190719.9	Modify column TEMPLATE_ID on table CDR_CDA_TEMPLATE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1841177512	postgres	2022-03-17 00:14:21.868551	1	t
73	2019.08.20190719.10	Modify column TEMPLATE_PARAMETER_NAME on table CDR_CDA_TEMPLATE_PARAM	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-316472956	postgres	2022-03-17 00:14:21.875087	1	t
74	2019.08.20190719.11	Drop table CDR_USER_2FA	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-201315108	postgres	2022-03-17 00:14:21.881891	1	t
75	2019.08.20190719.12	Add id generator SEQ_USERTFAKEY_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1428871420	postgres	2022-03-17 00:14:21.888701	1	t
76	2019.08.20190719.13	Add table CDR_USER_TFA_KEY	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1821027587	postgres	2022-03-17 00:14:21.895125	1	t
77	2019.08.20190719.14	Add IDX_USERTFAKEY_USER index to table CDR_USER_TFA_KEY	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	741041352	postgres	2022-03-17 00:14:21.902241	2	t
78	2019.08.20190719.15	Add foreign key FK_USERTFAKEY_USER from column USER_PID of table CDR_USER_TFA_KEY to column PID of table CDR_USER_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	887756861	postgres	2022-03-17 00:14:21.910504	2	t
79	2019.08.20190719.16	Add id generator SEQ_EMPISTDMTCHRUL_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	15886396	postgres	2022-03-17 00:14:21.91741	1	t
80	2019.08.20190719.17	Add table CDR_EMPI_STD_MATCH_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	2014300178	postgres	2022-03-17 00:14:21.923766	1	t
81	2019.08.20190719.18	Add foreign key FK_EMPISTDMTCHRUL_MODULE from column MODULE_PID of table CDR_EMPI_STD_MATCH_RULE to column PID of table CDR_MODULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1883343470	postgres	2022-03-17 00:14:21.929943	1	t
82	2019.08.20190719.19	Add id generator SEQ_EMPIMODRUL_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	96417609	postgres	2022-03-17 00:14:21.94342	2	t
83	2019.08.20190719.20	Add table CDR_EMPI_MODULE_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1556404441	postgres	2022-03-17 00:14:21.950536	1	t
84	2019.08.20190719.21	Add IDX_EMPIMODRUL_MOD index to table CDR_EMPI_MODULE_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1723476555	postgres	2022-03-17 00:14:21.958567	1	t
85	2019.08.20190719.22	Add foreign key FK_EMPIMODRUL_MODULE from column MODULE_PID of table CDR_EMPI_MODULE_RULE to column PID of table CDR_MODULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-920305510	postgres	2022-03-17 00:14:21.966151	2	t
86	2019.08.20190808.1	Add id generator SEQ_EMPIREVIEWQUEUE_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1209911175	postgres	2022-03-17 00:14:21.972986	1	t
87	2019.08.20190808.2	Add table CDR_EMPI_REVIEWQUEUE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1372383430	postgres	2022-03-17 00:14:21.979723	1	t
88	2019.08.20190808.3	Add foreign key FK_EMPIREVIEWQUEUE_MODULE from column MODULE_PID of table CDR_EMPI_REVIEWQUEUE to column PID of table CDR_MODULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	459189128	postgres	2022-03-17 00:14:21.986934	1	t
89	2019.08.20190808.4	Add id generator SEQ_EMPILINKRUL_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-961395569	postgres	2022-03-17 00:14:21.993489	1	t
90	2019.08.20190808.5	Add table CDR_EMPI_LINK_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-860481214	postgres	2022-03-17 00:14:22.000004	1	t
91	2019.08.20190808.6	Add foreign key FK_EMPILINKRUL_MODULE from column MODULE_PID of table CDR_EMPI_LINK_RULE to column PID of table CDR_MODULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1695971286	postgres	2022-03-17 00:14:22.007051	2	t
92	2019.08.20190828.1	Add column REVIEW_QUEUE_PID on table CDR_EMPI_LINK_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1117440149	postgres	2022-03-17 00:14:22.013983	2	t
93	2019.08.20190828.2	Add foreign key FK_EMPILINKRUL_REVIEW_QUEUE from column REVIEW_QUEUE_PID of table CDR_EMPI_LINK_RULE to column PID of table CDR_EMPI_REVIEWQUEUE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1922613225	postgres	2022-03-17 00:14:22.020819	1	t
94	2019.11.20191018.1	Modify column MATCH_NAME_FAMANDGVN on table CDR_EMPI_STD_MATCH_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-530612451	postgres	2022-03-17 00:14:22.027869	2	t
95	2019.11.20191018.2	Modify column MATCH_BIRTHDATE on table CDR_EMPI_STD_MATCH_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	2095574756	postgres	2022-03-17 00:14:22.034906	1	t
96	2019.11.20191018.3	Modify column MATCH_ADDR_GENDER on table CDR_EMPI_STD_MATCH_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1182759198	postgres	2022-03-17 00:14:22.042055	2	t
97	2019.11.20191018.4	Modify column MATCH_ADDR_CITY on table CDR_EMPI_STD_MATCH_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1247762656	postgres	2022-03-17 00:14:22.049108	2	t
98	2019.11.20191018.5	Modify column MATCH_ADDR_COUNTRY on table CDR_EMPI_STD_MATCH_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1183051415	postgres	2022-03-17 00:14:22.056576	2	t
99	2019.11.20191018.6	Modify column MATCH_ADDR_PC on table CDR_EMPI_STD_MATCH_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-624163000	postgres	2022-03-17 00:14:22.063739	1	t
100	2019.11.20191018.7	Modify column MATCH_ADDR_STATE on table CDR_EMPI_STD_MATCH_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1360749242	postgres	2022-03-17 00:14:22.071137	1	t
101	2019.11.20191111.1	Execute raw sql	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1594498032	postgres	2022-03-17 00:14:22.079227	2	t
102	2019.11.20191211.1	Add column PKCE_CHALLENGE on table CDR_OAUTH2_AUTH_CODE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1523702348	postgres	2022-03-17 00:14:22.086354	1	t
103	2019.11.20191211.2	Add column PKCE_CHALLENGE_TYPE on table CDR_OAUTH2_AUTH_CODE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1941736631	postgres	2022-03-17 00:14:22.093079	1	t
104	2020.02.20191127.00	Initialize Quartz schema	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	2061624055	postgres	2022-03-17 00:14:22.277726	179	t
105	2020.02.20200122.1	Add id generator SEQ_NODEPROC_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1806349177	postgres	2022-03-17 00:14:22.285697	2	t
106	2020.02.20200122.2	Add table CDR_NODE_PROCESS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1444084010	postgres	2022-03-17 00:14:22.292743	1	t
107	2020.02.20200122.3	Add IDX_NODEPROC_PROCID index to table CDR_NODE_PROCESS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1019731208	postgres	2022-03-17 00:14:22.299751	2	t
108	2020.02.20200122.4	Add foreign key FK_NODEPROCESS_NODE from column NODE_PID of table CDR_NODE_PROCESS to column PID of table CDR_NODE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	2093486452	postgres	2022-03-17 00:14:22.306473	1	t
109	2020.02.20200122.5	Drop table CDR_NODE_STATUS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	440567830	postgres	2022-03-17 00:14:22.312951	1	t
110	2020.02.20200122.6	Add id generator SEQ_MODPROC_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-709506983	postgres	2022-03-17 00:14:22.319636	1	t
111	2020.02.20200122.7	Add table CDR_MODULE_PROCESS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1154768480	postgres	2022-03-17 00:14:22.326349	1	t
112	2020.02.20200122.8	Add IDX_MODPROC_NODEPROC_MOD index to table CDR_MODULE_PROCESS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-241619073	postgres	2022-03-17 00:14:22.33288	1	t
113	2020.02.20200122.9	Add foreign key FK_MODPROC_NODEPROC from column NODEPROC_PID of table CDR_MODULE_PROCESS to column PID of table CDR_NODE_PROCESS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1362122849	postgres	2022-03-17 00:14:22.339475	1	t
114	2020.02.20200122.10	Add foreign key FK_MODPROC_MODULE from column MODULE_PID of table CDR_MODULE_PROCESS to column PID of table CDR_MODULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1431640423	postgres	2022-03-17 00:14:22.346053	1	t
115	2020.02.20200122.17	Add id generator SEQ_METRICHC_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1652762700	postgres	2022-03-17 00:14:22.35273	1	t
116	2020.02.20200122.18	Add table CDR_METRIC_HC	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1113447702	postgres	2022-03-17 00:14:22.359264	1	t
117	2020.02.20200122.19	Add foreign key FK_HC_MODP from column MODPROC_PID of table CDR_METRIC_HC to column PID of table CDR_MODULE_PROCESS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1471189354	postgres	2022-03-17 00:14:22.365915	1	t
118	2020.02.20200122.20	Add IDX_METRICHC_NODEP_HID index to table CDR_METRIC_HC	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-2027584274	postgres	2022-03-17 00:14:22.372545	1	t
119	2020.02.20200122.21	Drop table CDR_CLUSTMGR_MODULE_MET_GAUGE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1451946594	postgres	2022-03-17 00:14:22.379276	1	t
120	2020.02.20200122.22	Add table CDR_METRIC_GAUGE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-659650739	postgres	2022-03-17 00:14:22.386249	1	t
121	2020.02.20200122.23	Drop table CDR_CLUSTMGR_MODULE_METRIC_TMR	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-653920212	postgres	2022-03-17 00:14:22.393185	1	t
122	2020.02.20200122.24	Add table CDR_METRIC_TIMER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-81670197	postgres	2022-03-17 00:14:22.399888	1	t
123	2020.02.20200122.25	Drop column MODULE_STATUS from table CDR_MODULE_STATUS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-129499583	postgres	2022-03-17 00:14:22.406806	1	t
124	2020.02.20200122.26	Drop column MODULE_STATUS_DESC from table CDR_MODULE_STATUS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1040413319	postgres	2022-03-17 00:14:22.41357	1	t
125	2020.02.20200122.27	Drop column PORTVAL from table CDR_MODULE_STATUS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	226789372	postgres	2022-03-17 00:14:22.420471	1	t
126	2020.02.20200122.28	Add column PORTVAL on table CDR_MODULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	280128033	postgres	2022-03-17 00:14:22.427514	1	t
127	2020.02.20200122.29	Drop column RESTART_REQUIRED from table CDR_MODULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1080013350	postgres	2022-03-17 00:14:22.434388	1	t
128	2020.02.20200122.30	Drop table CDR_CLUSTMGR_MODULE_METRIC_HC	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1822209294	postgres	2022-03-17 00:14:22.441215	1	t
129	2020.02.20200122.31	Add foreign key FK_METGAUGE_MODP from column MODPROC_PID of table CDR_METRIC_GAUGE to column PID of table CDR_MODULE_PROCESS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1359425836	postgres	2022-03-17 00:14:22.448086	1	t
130	2020.02.20200122.32	Add foreign key FK_METTIMER_MODP from column MODPROC_PID of table CDR_METRIC_TIMER to column PID of table CDR_MODULE_PROCESS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1303932044	postgres	2022-03-17 00:14:22.454854	1	t
131	2020.02.20200122.33	Add IDX_NODE_ID index to table CDR_NODE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1779840839	postgres	2022-03-17 00:14:22.461456	1	t
132	2020.02.20200122.34	Add column IS_DELETED on table CDR_NODE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-922851044	postgres	2022-03-17 00:14:22.468386	2	t
133	2020.02.20200122.35	Add id generator SEQ_MODSTAT_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1613855831	postgres	2022-03-17 00:14:22.474964	1	t
134	2020.02.20200122.36	Add table CDR_MODULE_STATE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	166194092	postgres	2022-03-17 00:14:22.481424	1	t
135	2020.02.20200122.37	Add IDX_MODSTAT_MOD index to table CDR_MODULE_STATE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	768559108	postgres	2022-03-17 00:14:22.488147	1	t
136	2020.02.20200122.38	Add IDX_MODSTAT_MODTYPE index to table CDR_MODULE_STATE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-579772790	postgres	2022-03-17 00:14:22.494972	1	t
137	2020.02.20200122.39	Add foreign key FK_MODSTAT_MODULE from column MODULE_PID of table CDR_MODULE_STATE to column PID of table CDR_MODULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	244491085	postgres	2022-03-17 00:14:22.501894	1	t
138	2020.02.20200122.40	Drop table CDR_MODULE_STATUS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1627800596	postgres	2022-03-17 00:14:22.508381	1	t
139	2020.02.20200122.41	Execute raw sql	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1267002919	postgres	2022-03-17 00:14:22.514939	1	t
140	2020.02.20200122.42	Execute raw sql	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-151034102	postgres	2022-03-17 00:14:22.521732	1	t
141	2020.02.20200122.43	Drop column MASTER_MODULE_PID from table CDR_MODULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1861477120	postgres	2022-03-17 00:14:22.528352	1	t
142	2020.02.20200122.44	Add IDX_GAUGE_MODCOLLINTSTART index to table CDR_METRIC_GAUGE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-205852536	postgres	2022-03-17 00:14:22.534923	1	t
143	2020.02.20200122.45	Add IDX_GAUGE_MODCOLLSTART index to table CDR_METRIC_GAUGE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-583627359	postgres	2022-03-17 00:14:22.541427	1	t
144	2020.02.20200122.46	Add IDX_TIMER_MODCOLLINTSTART index to table CDR_METRIC_TIMER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1229577196	postgres	2022-03-17 00:14:22.547934	1	t
145	2020.02.20200122.47	Add IDX_TIMER_MODCOLLSTART index to table CDR_METRIC_TIMER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1812733009	postgres	2022-03-17 00:14:22.55439	1	t
146	2020.02.20200204.1	Drop column OPTLOCK from table CDR_NODE_PROCESS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	899887527	postgres	2022-03-17 00:14:22.560812	1	t
147	2020.05.20200324.1	Add column OPT_LOCK on table CDR_NODE_PROCESS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1307865182	postgres	2022-03-17 00:14:22.567322	1	t
148	2020.05.20200324.2	Execute raw sql	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-992866373	postgres	2022-03-17 00:14:22.573845	1	t
149	2020.05.20200324.3	Modify column OPT_LOCK on table CDR_NODE_PROCESS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1307864960	postgres	2022-03-17 00:14:22.580259	1	t
150	2020.05.20200423.1	Drop column TENANT_ID_STR from table CDR_AUDIT_EVT_TARGET_RES	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	884573003	postgres	2022-03-17 00:14:22.586891	1	t
151	2020.05.20200430.1	Add column SRC_GUID on table CDR_XACT_LOG	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1844771150	postgres	2022-03-17 00:14:22.593674	1	t
152	2020.05.20200430.2	Add IDX_GUID index to table CDR_XACT_LOG	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	929575115	postgres	2022-03-17 00:14:22.600435	1	t
153	2020.08.20200519.1	Add column CDR_ENDPOINT_MODULE_PID on table CDR_XACT_LOG	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	733546317	postgres	2022-03-17 00:14:22.627838	2	t
154	2020.08.20200519.2	Add foreign key FK_XACTLOGSTEP_MODULE from column CDR_ENDPOINT_MODULE_PID of table CDR_XACT_LOG to column PID of table CDR_MODULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	265009354	postgres	2022-03-17 00:14:22.634186	1	t
155	2020.11.20200827.01	Drop id generator SEQ_EMPIMODRUL_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	96417609	postgres	2022-03-17 00:14:22.640984	1	t
156	2020.11.20200827.02	Drop id generator SEQ_EMPILINKRUL_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-961395569	postgres	2022-03-17 00:14:22.647259	1	t
157	2020.11.20200827.03	Drop id generator SEQ_EMPIREVIEWQUEUE_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1209911175	postgres	2022-03-17 00:14:22.653909	1	t
158	2020.11.20200827.04	Drop id generator SEQ_EMPISTDMTCHRUL_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	15886396	postgres	2022-03-17 00:14:22.660364	1	t
159	2020.11.20200827.05	NopTask	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	17	postgres	2022-03-17 00:14:22.666836	1	t
160	2020.11.20200827.06	NopTask	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	17	postgres	2022-03-17 00:14:22.67327	1	t
161	2020.11.20200827.07	NopTask	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	17	postgres	2022-03-17 00:14:22.679677	1	t
162	2020.11.20200827.08	NopTask	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	17	postgres	2022-03-17 00:14:22.685985	1	t
163	2020.11.20200827.09	NopTask	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	17	postgres	2022-03-17 00:14:22.692651	1	t
164	2020.11.20200827.10	NopTask	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	17	postgres	2022-03-17 00:14:22.699187	1	t
165	2020.11.20200901.1	Add column FEDERATION_JWKS_URL on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-458980274	postgres	2022-03-17 00:14:22.705861	1	t
166	2020.11.20200901.2	Add column FEDERATION_AUTH_URL on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1891619371	postgres	2022-03-17 00:14:22.712025	1	t
167	2020.11.20200901.3	Add column FEDERATION_REQ_SCOPES on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1256748547	postgres	2022-03-17 00:14:22.720608	1	t
168	2020.11.20200901.4	Add column FEDERATION_TOKEN_URL on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-2075712502	postgres	2022-03-17 00:14:22.726785	1	t
169	2020.11.20200901.5	Add column FEDERATION_USER_INFO_URL on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-2123900913	postgres	2022-03-17 00:14:22.732882	1	t
170	2020.11.20200901.6	Add column FEDERATION_AUTH_SCRIPT_TEXT on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1153087747	postgres	2022-03-17 00:14:22.739353	1	t
171	2020.11.20200901.7	Add column FEDERATION_REG_ID on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	472492907	postgres	2022-03-17 00:14:22.744946	1	t
172	2020.11.20200901.8	Create FEDERATION_REG_ID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	760005019	postgres	2022-03-17 00:14:22.751039	1	t
173	2020.11.20200901.9	Modify column FEDERATION_REG_ID on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	472493129	postgres	2022-03-17 00:14:22.756794	1	t
174	2020.11.20200901.10	Add IDX_OA2SERVER_FED_REG_ID index to table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	899482149	postgres	2022-03-17 00:14:22.762286	1	t
175	2020.11.20200906.01	Drop foreign key FK_EMPIMODRUL_MODULE from table CDR_EMPI_MODULE_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-449143909	postgres	2022-03-17 00:14:22.768034	1	t
176	2020.11.20200906.02	Drop index IDX_EMPIMODRUL_MOD from table CDR_EMPI_MODULE_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-2146832719	postgres	2022-03-17 00:14:22.773946	1	t
177	2020.11.20200906.03	Drop table CDR_EMPI_MODULE_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1473825996	postgres	2022-03-17 00:14:22.780055	1	t
178	2020.11.20200906.04	Drop table CDR_EMPI_LINK_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-509074842	postgres	2022-03-17 00:14:22.785967	1	t
179	2020.11.20200906.05	Drop table CDR_EMPI_STD_MATCH_RULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-347883081	postgres	2022-03-17 00:14:22.791464	1	t
180	2020.11.20200906.06	Drop table CDR_EMPI_REVIEWQUEUE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1068068574	postgres	2022-03-17 00:14:22.797596	1	t
181	2021.02.20210107.1	Add column ID_TOKEN_BYTES on table CDR_OAUTH2_ATOKEN	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-266362736	postgres	2022-03-17 00:14:22.80343	1	t
182	2021.02.20210113.1	Modify column TOKEN_VAL on table CDR_OAUTH2_ATOKEN	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-2120896898	postgres	2022-03-17 00:14:22.809218	1	t
183	2021.02.20210113.2	Add column TOKEN_BYTES on table CDR_OAUTH2_ATOKEN	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1148065956	postgres	2022-03-17 00:14:22.815022	1	t
184	2021.02.20210125.1	Add id generator SEQ_AG_APPL_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1579100165	postgres	2022-03-17 00:14:22.820898	1	t
185	2021.02.20210125.2	Add table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1685884183	postgres	2022-03-17 00:14:22.830665	1	t
186	2021.02.20210125.3	Add foreign key FK_AG_APPL_MODULE from column MODULE_PID of table AG_APPL to column PID of table CDR_MODULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-2059596761	postgres	2022-03-17 00:14:22.838684	3	t
187	2021.02.20210125.4	Add foreign key FK_AG_APPL_OAUTH2_CLIENT from column OAUTH2_CLIENT_PID of table AG_APPL to column PID of table CDR_OAUTH2_CLIENT_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1713986945	postgres	2022-03-17 00:14:22.844823	1	t
188	2021.02.20210126.1	Add id generator SEQ_AG_CLASS_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-526647392	postgres	2022-03-17 00:14:22.854974	1	t
189	2021.02.20210126.2	Add table AG_CLASS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	373704465	postgres	2022-03-17 00:14:22.862526	1	t
190	2021.02.20210126.3	Add IDX_AG_CLASSIFICATION_PID index to table AG_CLASS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1282043118	postgres	2022-03-17 00:14:22.869131	1	t
191	2021.02.20210126.4	Add foreign key FK_AG_CLASS_AG_APPL from column AG_APPL_PID of table AG_CLASS to column PID of table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1235460591	postgres	2022-03-17 00:14:22.87574	1	t
192	2021.02.20210127.1	Add id generator SEQ_AG_NOTE_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1981346316	postgres	2022-03-17 00:14:22.884737	1	t
193	2021.02.20210127.2	Add table AG_NOTE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1678087641	postgres	2022-03-17 00:14:22.893194	1	t
194	2021.02.20210127.3	Add foreign key FK_AG_NOTE_AG_APPL from column AG_APPL_PID of table AG_NOTE to column PID of table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1926789045	postgres	2022-03-17 00:14:22.899923	1	t
195	2021.02.20210202.1	Add column ATTESTATION_ACCEPTED on table CDR_OAUTH2_CLIENT_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-799978758	postgres	2022-03-17 00:14:22.907326	1	t
196	2021.02.20210205.1	Add column FAILED_LOGIN_ATTEMPTS on table CDR_USER_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	482346601	postgres	2022-03-17 00:14:22.913974	1	t
197	2021.05.20210225.1	Add column VERSION_NUMBER on table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-489051200	postgres	2022-03-17 00:14:22.920691	1	t
198	2021.05.20210225.2	Add column PARENT_PID on table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-345222130	postgres	2022-03-17 00:14:22.928214	1	t
199	2021.05.20210225.3	Add foreign key FK_AG_APPL_PARENT_PID from column PARENT_PID of table AG_APPL to column PID of table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-765350791	postgres	2022-03-17 00:14:22.93585	1	t
200	2021.05.20210225.4	Add column USER_PID on table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-608126453	postgres	2022-03-17 00:14:22.943616	2	t
201	2021.05.20210225.5	Add foreign key FK_AG_APPL_USER from column USER_PID of table AG_APPL to column PID of table CDR_USER_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1816056581	postgres	2022-03-17 00:14:22.951146	2	t
202	2021.05.20210318.1	Add column RES_VERSION_STR on table CDR_AUDIT_EVT_TARGET_RES	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	455429368	postgres	2022-03-17 00:14:22.957439	1	t
203	2021.05.20210322.1	Add column HAVE_HEADERS on table CDR_AUDIT_EVT	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1734095564	postgres	2022-03-17 00:14:22.963406	1	t
204	2021.05.20210322.2	Add id generator SEQ_AUDITEVT_HEADER_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1422755749	postgres	2022-03-17 00:14:22.969641	2	t
205	2021.05.20210322.3	Add table CDR_AUDIT_EVT_HEADER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1453599644	postgres	2022-03-17 00:14:22.9759	1	t
206	2021.05.20210322.4	Add IDX_AUDITEVT_HEADER_EVT index to table CDR_AUDIT_EVT_HEADER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	921140084	postgres	2022-03-17 00:14:22.982226	1	t
207	2021.05.20210322.5	Add foreign key FK_AUDITEVT_HEADER_EVT from column EVENT_PID of table CDR_AUDIT_EVT_HEADER to column PID of table CDR_AUDIT_EVT	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-448932228	postgres	2022-03-17 00:14:22.98806	1	t
208	2021.05.20210323.1	Add id generator SEQ_USER_OA2CLN_TOS_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	2129896819	postgres	2022-03-17 00:14:22.994397	1	t
209	2021.05.20210323.2	Add table CDR_USER_OA2CLN_TOS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1749735159	postgres	2022-03-17 00:14:23.000764	1	t
210	2021.05.20210323.3	Add foreign key FK_USER_OA2CLN_TOS_CLIENT from column CLIENT_PID of table CDR_USER_OA2CLN_TOS to column PID of table CDR_OAUTH2_CLIENT_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-308332507	postgres	2022-03-17 00:14:23.00737	1	t
211	2021.05.20210323.4	Add foreign key FK_USER_OA2CLN_TOS_USER from column USER_PID of table CDR_USER_OA2CLN_TOS to column PID of table CDR_USER_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1131494979	postgres	2022-03-17 00:14:23.013501	1	t
212	2021.05.20210323.5	Add IDX_USER_OA2CLN_TOS_USRCLNT index to table CDR_USER_OA2CLN_TOS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-620389149	postgres	2022-03-17 00:14:23.019808	2	t
213	2021.05.20210331.1	Add id generator SEQ_METRICHEALTH_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1175116499	postgres	2022-03-17 00:14:23.026386	2	t
214	2021.05.20210331.2	Add table CDR_METRIC_HEALTH	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1923609934	postgres	2022-03-17 00:14:23.032589	1	t
215	2021.05.20210331.3	Add foreign key FK_HEALTH_MODP from column MODPROC_PID of table CDR_METRIC_HEALTH to column PID of table CDR_MODULE_PROCESS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	34956834	postgres	2022-03-17 00:14:23.038642	1	t
216	2021.05.20210331.4	Add IDX_METRICHC_MOD_TYPE_NAME index to table CDR_METRIC_HEALTH	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-501411236	postgres	2022-03-17 00:14:23.044909	1	t
217	2021.05.20210407.1	Add table CDR_OAUTH2_RTOKEN_LNCHRESID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1379859279	postgres	2022-03-17 00:14:23.050543	1	t
218	2021.05.20210407.2	Add foreign key FK_OA2RTOKLNCHRESID_TOKEN from column TOKEN_PID of table CDR_OAUTH2_RTOKEN_LNCHRESID to column PID of table CDR_OAUTH2_REFRESH_TOKEN	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1438680040	postgres	2022-03-17 00:14:23.056562	1	t
219	2021.05.20210407.3	Add id generator SEQ_OA2RTOKLNCHRESID_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1042161097	postgres	2022-03-17 00:14:23.06243	1	t
220	2021.05.20210409.1	Add id generator SEQ_AG_DATA_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-2105698876	postgres	2022-03-17 00:14:23.068731	2	t
221	2021.05.20210409.2	Add table AG_DATA	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1624301389	postgres	2022-03-17 00:14:23.075054	1	t
222	2021.05.20210409.3	Add column ICON_PID on table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-801031359	postgres	2022-03-17 00:14:23.081336	1	t
223	2021.05.20210409.4	Add column HOME_URL on table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-640959304	postgres	2022-03-17 00:14:23.087289	1	t
224	2021.05.20210409.5	Modify column LAUNCH_URL on table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	950646716	postgres	2022-03-17 00:14:23.093294	1	t
225	2021.05.20210409.6	Add foreign key FK_AG_APPL_ICON from column ICON_PID of table AG_APPL to column PID of table AG_DATA	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	2118209202	postgres	2022-03-17 00:14:23.099379	1	t
226	2021.05.20210409.7	Add column IDENTIFIER on table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-2052779702	postgres	2022-03-17 00:14:23.10571	2	t
227	2021.05.20210409.8	Add IDX_AG_APPL_IDENTIFIER index to table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1633441688	postgres	2022-03-17 00:14:23.111598	1	t
228	2021.05.20210409.9	Add column CONFIDENTIAL on table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	2066687972	postgres	2022-03-17 00:14:23.117638	1	t
229	2021.05.20210420.1	Add id generator SEQ_AG_PROFILE_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	372946321	postgres	2022-03-17 00:14:23.123502	1	t
230	2021.05.20210420.2	Add table AG_PROFILE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	741175641	postgres	2022-03-17 00:14:23.129606	1	t
231	2021.05.20210420.3	Add foreign key FK_AG_PROFILE_MODULE from column MODULE_PID of table AG_PROFILE to column PID of table CDR_MODULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1437151283	postgres	2022-03-17 00:14:23.135721	1	t
232	2021.05.20210420.4	Add foreign key FK_AG_PROFILE_USER from column USER_PID of table AG_PROFILE to column PID of table CDR_USER_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-732978937	postgres	2022-03-17 00:14:23.142202	1	t
233	2021.05.20210420.5	Add id generator SEQ_AG_ADDRESS_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1182029220	postgres	2022-03-17 00:14:23.14786	1	t
234	2021.05.20210420.6	Add table AG_ADDRESS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-576753871	postgres	2022-03-17 00:14:23.153976	1	t
235	2021.05.20210420.7	Add foreign key FK_AG_ADDRESS_AG_PROFILE from column AG_PROFILE_PID of table AG_ADDRESS to column PID of table AG_PROFILE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1672076447	postgres	2022-03-17 00:14:23.160592	1	t
236	2021.05.20210420.8	Add id generator SEQ_AG_PHONE_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1545951082	postgres	2022-03-17 00:14:23.167185	1	t
237	2021.05.20210420.9	Add table AG_PHONE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	870868878	postgres	2022-03-17 00:14:23.173342	1	t
238	2021.05.20210420.10	Add foreign key FK_AG_PHONE_AG_PROFILE from column AG_PROFILE_PID of table AG_PHONE to column PID of table AG_PROFILE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1788433647	postgres	2022-03-17 00:14:23.179134	1	t
239	2021.05.20210420.11	Add column PROFILE_PID on table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1464200721	postgres	2022-03-17 00:14:23.185447	1	t
240	2021.05.20210420.12	Add foreign key FK_AG_APPL_AG_PROFILE from column PROFILE_PID of table AG_APPL to column PID of table AG_PROFILE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1472554690	postgres	2022-03-17 00:14:23.1915	1	t
241	2021.05.20210421.1	Add id generator SEQ_AG_SCOPE_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1554761340	postgres	2022-03-17 00:14:23.197551	1	t
242	2021.05.20210421.2	Add table AG_SCOPE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	96491999	postgres	2022-03-17 00:14:23.204147	2	t
243	2021.05.20210421.3	Add foreign key FK_AG_SCOPE_AG_APPL from column AG_APPL_PID of table AG_SCOPE to column PID of table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-2051870295	postgres	2022-03-17 00:14:23.20993	1	t
244	2021.05.20210423.1	Drop column FIRST_NAME from table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1421420727	postgres	2022-03-17 00:14:23.21553	1	t
245	2021.05.20210423.2	Drop column LAST_NAME from table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1602063473	postgres	2022-03-17 00:14:23.221493	1	t
246	2021.05.20210423.3	Drop column COUNTRY from table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1551392429	postgres	2022-03-17 00:14:23.227579	1	t
247	2021.05.20210423.4	Drop column COMPANY_NAME from table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	549507850	postgres	2022-03-17 00:14:23.235446	3	t
248	2021.05.20210423.5	Drop column COMPANY_SITE_URL from table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	400462806	postgres	2022-03-17 00:14:23.24264	2	t
249	2021.05.20210426.1	Drop column COUNTRY_CODE from table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	600699635	postgres	2022-03-17 00:14:23.249355	2	t
250	2021.05.20210426.2	Drop column SUPPORT_PHONE_NUMBER from table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1265853383	postgres	2022-03-17 00:14:23.256306	2	t
251	2021.05.20210426.3	Drop column SUPPORT_EMAIL from table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	157139145	postgres	2022-03-17 00:14:23.262233	1	t
252	2021.05.20210429.1	Add column VERSION on table CDR_USER_OA2CLN_TOS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1840345691	postgres	2022-03-17 00:14:23.268221	1	t
253	2021.05.20210430.1	Add column ARCHIVE_DATE on table AG_PROFILE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	2319868	postgres	2022-03-17 00:14:23.276368	3	t
254	2021.05.20210504.1	Add column VERSION on table CDR_USER_OA2CLN_TOS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1840345469	postgres	2022-03-17 00:14:23.283489	2	t
255	2021.05.20210504.2	Execute raw sql	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1462087979	postgres	2022-03-17 00:14:23.290324	2	t
256	2021.05.20210504.3	Modify column VERSION on table CDR_USER_OA2CLN_TOS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1840345691	postgres	2022-03-17 00:14:23.297485	2	t
257	2021.05.20210505.1	Add column SEED on table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1620345046	postgres	2022-03-17 00:14:23.304586	2	t
258	2021.05.20210514.1	Add id generator SEQ_AG_ATTESTATION_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1441252424	postgres	2022-03-17 00:14:23.310991	1	t
259	2021.05.20210514.2	Add table AG_ATTESTATION	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1852311308	postgres	2022-03-17 00:14:23.317	1	t
260	2021.05.20210514.3	Add foreign key FK_AG_ATTESTATION_HTML from column HTML_PID of table AG_ATTESTATION to column PID of table AG_DATA	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1032959698	postgres	2022-03-17 00:14:23.323313	1	t
261	2021.05.20210514.4	Add foreign key FK_AG_ATTESTATION_MODULE from column MODULE_PID of table AG_ATTESTATION to column PID of table CDR_MODULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1588791685	postgres	2022-03-17 00:14:23.329816	2	t
262	2021.05.20210514.5	Add column ATTESTATION_PID on table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1376440772	postgres	2022-03-17 00:14:23.336161	1	t
263	2021.05.20210514.6	Add foreign key FK_AG_APPL_AG_ATTESTATION from column ATTESTATION_PID of table AG_APPL to column PID of table AG_ATTESTATION	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-902890593	postgres	2022-03-17 00:14:23.343694	2	t
264	2021.05.20210517.1	Add column PLAIN_HTML_PID on table AG_ATTESTATION	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1646750191	postgres	2022-03-17 00:14:23.351117	2	t
265	2021.05.20210517.2	Add foreign key FK_AG_ATTESTATION_PLAIN_HTML from column PLAIN_HTML_PID of table AG_ATTESTATION to column PID of table AG_DATA	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1768615296	postgres	2022-03-17 00:14:23.357994	2	t
266	2021.05.20210517.3	Add IDX_AG_ATTEST_ARCHIVE_DATE index to table AG_ATTESTATION	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	731022177	postgres	2022-03-17 00:14:23.364606	1	t
267	2021.08.20210602.1	Modify column PARM_VALUE on table CDR_OAUTH2_RTOKEN_REQPRM	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	26729054	postgres	2022-03-17 00:14:23.370475	1	t
268	2021.08.20210604.1	Add column EVT_ADDITIONAL_JSON on table CDR_AUDIT_EVT	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-80664031	postgres	2022-03-17 00:14:23.376614	1	t
269	2021.08.20210606.1	Modify column JWKS_FILE on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1959190475	postgres	2022-03-17 00:14:23.38252	1	t
270	2021.08.20210606.2	Modify column FEDERATION_REG_ID on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	472493429	postgres	2022-03-17 00:14:23.389219	1	t
271	2021.08.20210606.3	Modify column FEDERATION_JWKS_URL on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-458979974	postgres	2022-03-17 00:14:23.395418	1	t
272	2021.08.20210606.4	Modify column FEDERATION_AUTH_URL on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1891619071	postgres	2022-03-17 00:14:23.402246	1	t
273	2021.08.20210606.5	Modify column FEDERATION_REQ_SCOPES on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1256748247	postgres	2022-03-17 00:14:23.40822	1	t
274	2021.08.20210606.6	Modify column FEDERATION_TOKEN_URL on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-2075712202	postgres	2022-03-17 00:14:23.413907	1	t
275	2021.08.20210606.7	Modify column FEDERATION_USER_INFO_URL on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-2123900613	postgres	2022-03-17 00:14:23.419507	1	t
276	2021.08.20210608.1	Add column PUBLIC_JWKS on table CDR_OAUTH2_CLIENT_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	17634440	postgres	2022-03-17 00:14:23.425819	1	t
277	2021.08.20210616.1	Modify column MODULE_ID on table CDR_MODULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-2071407719	postgres	2022-03-17 00:14:23.433047	2	t
278	2021.08.20210715.1	Add id generator SEQ_AG_OAUTH_REDIRECT_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1103959678	postgres	2022-03-17 00:14:23.439583	1	t
279	2021.08.20210715.2	Add table AG_OAUTH_REDIRECT	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1162314897	postgres	2022-03-17 00:14:23.445899	1	t
280	2021.08.20210715.3	Add IDX_AG_OAUTH_REDIRECT_PID index to table AG_OAUTH_REDIRECT	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	576763200	postgres	2022-03-17 00:14:23.45171	1	t
281	2021.08.20210715.4	Add foreign key FK_AG_OAUTH_REDIRECT_AG_APPL from column AG_APPL_PID of table AG_OAUTH_REDIRECT to column PID of table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1240396073	postgres	2022-03-17 00:14:23.45767	1	t
282	2021.08.20210719.1	Add column FEDERATION_USER_MAPPING_TEXT on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1078810451	postgres	2022-03-17 00:14:23.464101	2	t
283	2021.08.20210829.1	Execute raw sql	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1393061647	postgres	2022-03-17 00:14:23.470883	2	t
284	2021.08.20210830.1	Add id generator SEQ_AG_SANDBOX_CLIENT_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-641702211	postgres	2022-03-17 00:14:23.476938	1	t
285	2021.08.20210830.2	Add table AG_SANDBOX_CLIENT	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-362231925	postgres	2022-03-17 00:14:23.48349	2	t
286	2021.08.20210830.3	Add foreign key FK_AG_SANDBOX_CLIENT_MODULE from column MODULE_PID of table AG_SANDBOX_CLIENT to column PID of table CDR_MODULE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1357684199	postgres	2022-03-17 00:14:23.489857	1	t
287	2021.08.20210830.4	Add foreign key FK_AG_SANDBOX_CLIENT_OAUTH2_CLIENT from column OAUTH2_CLIENT_PID of table AG_SANDBOX_CLIENT to column PID of table CDR_OAUTH2_CLIENT_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-125193935	postgres	2022-03-17 00:14:23.496164	2	t
288	2021.08.20210830.5	Add foreign key FK_AG_SANDBOX_CLIENT_USER from column USER_PID of table AG_SANDBOX_CLIENT to column PID of table CDR_USER_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1350156475	postgres	2022-03-17 00:14:23.502486	1	t
289	2021.11.20210824.1	Add table CDR_OAUTH2_RTOKEN_UDATA	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1987167860	postgres	2022-03-17 00:14:23.508977	1	t
290	2021.11.20210824.2	Add foreign key FK_OA2RTOKUD_TOKEN from column TOKEN_PID of table CDR_OAUTH2_RTOKEN_UDATA to column PID of table CDR_OAUTH2_REFRESH_TOKEN	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	915012078	postgres	2022-03-17 00:14:23.515075	1	t
291	2021.11.20210902.1	Rename column DATA to DATA_LOB on table AG_DATA	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-689409164	postgres	2022-03-17 00:14:23.521441	2	t
292	2021.11.20210902.2	Drop foreign key FK_AG_SANDBOX_CLIENT_OAUTH2_CLIENT from table AG_SANDBOX_CLIENT	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-185292633	postgres	2022-03-17 00:14:23.527614	1	t
293	2021.11.20210902.3	Add foreign key FK_AG_CLIENT_OAUTH2_CLIENT from column OAUTH2_CLIENT_PID of table AG_SANDBOX_CLIENT to column PID of table CDR_OAUTH2_CLIENT_DETAILS	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1399160153	postgres	2022-03-17 00:14:23.534125	2	t
294	2021.11.20210903.1	Rename column NAME to APP_NAME on table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1374305007	postgres	2022-03-17 00:14:23.540137	1	t
295	2021.11.20210913.1	Add column PROFILE_TYPE on table AG_PROFILE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1678523923	postgres	2022-03-17 00:14:23.546234	1	t
296	2021.11.20210920.1	Rename column KEY to TOKEN_KEY on table CDR_OAUTH2_RTOKEN_UDATA	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	2063332758	postgres	2022-03-17 00:14:23.552823	1	t
297	2021.11.20210920.2	Modify column TOKEN_KEY on table CDR_OAUTH2_RTOKEN_UDATA	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1547325863	postgres	2022-03-17 00:14:23.559954	1	t
298	2021.11.20210920.3	Add table CDR_OAUTH2_RTOKEN_UDATA	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1885838567	postgres	2022-03-17 00:14:23.566294	1	t
299	2021.11.20210920.4	Add foreign key FK_OA2RTOKUD_TOKEN from column TOKEN_PID of table CDR_OAUTH2_RTOKEN_UDATA to column PID of table CDR_OAUTH2_REFRESH_TOKEN	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	915012078	postgres	2022-03-17 00:14:23.574804	3	t
300	2021.11.20211011.1	Migrate text clob NOTES from table CDR_USER_DETAILS (only affects Postgresql)	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	802769046	postgres	2022-03-17 00:14:23.58121	1	t
301	2021.11.20211011.2	Migrate text clob EVT_ADDITIONAL_JSON from table CDR_AUDIT_EVT (only affects Postgresql)	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1624756382	postgres	2022-03-17 00:14:23.587067	1	t
302	2021.11.20211011.3	Migrate text clob TEMPLATE_CONTENT from table CDR_CDA_TEMPLATE (only affects Postgresql)	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-6926912	postgres	2022-03-17 00:14:23.593296	1	t
303	2021.11.20211011.4	Migrate text clob JWKS_TEXT from table CDR_OA2_SERVER (only affects Postgresql)	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1479229456	postgres	2022-03-17 00:14:23.599716	1	t
304	2021.11.20211011.5	Migrate text clob VALUE_EXTENDED from table CDR_MODULE_CFG_PROP (only affects Postgresql)	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-378363521	postgres	2022-03-17 00:14:23.605678	1	t
305	2021.11.20211019.1	Add id generator SEQ_AG_DOCUMENT_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	246131253	postgres	2022-03-17 00:14:23.611338	1	t
306	2021.11.20211019.2	Add table AG_DOCUMENT	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1694938153	postgres	2022-03-17 00:14:23.617424	1	t
307	2021.11.20211019.3	Add foreign key FK_AG_DOCUMENT_DATA_BLOB from column DOCUMENT_PID of table AG_DOCUMENT to column PID of table AG_DATA	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-270343965	postgres	2022-03-17 00:14:23.623708	2	t
308	2021.11.20211019.4	Add foreign key FK_AG_DOCUMENT_AG_APPL from column AG_APPL_PID of table AG_DOCUMENT to column PID of table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	38826639	postgres	2022-03-17 00:14:23.62997	1	t
309	2021.11.20211101.1	Execute raw sql	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1066404472	postgres	2022-03-17 00:14:23.636813	2	t
310	2021.11.20211102.1	Add column FHIR_ENDPOINT_URL on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1131052654	postgres	2022-03-17 00:14:23.64464	2	t
311	2021.11.20211102.2	Add column NOTES on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1155520370	postgres	2022-03-17 00:14:23.651516	2	t
312	2021.11.20211102.3	Add column AUTH_WELL_KNOWN_CONFIG_URL on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-911068315	postgres	2022-03-17 00:14:23.657307	1	t
313	2021.11.20211102.4	Add column CUSTOM_TOKEN_PARAMS on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1105831727	postgres	2022-03-17 00:14:23.665711	4	t
314	2021.11.20211102.5	Add column RESPONSE_TYPE on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-460291019	postgres	2022-03-17 00:14:23.671898	2	t
315	2021.11.20211102.6	Add column ORGANIZATION_ID on table CDR_OA2_SERVER	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-82331960	postgres	2022-03-17 00:14:23.677749	1	t
316	2021.11.20211124.1	Execute raw sql	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-440131272	postgres	2022-03-17 00:14:23.684723	1	t
317	2022.02.20211123.1	Add id generator SEQ_AG_SCREENSHOT_PID	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1258635968	postgres	2022-03-17 00:14:23.690608	1	t
318	2022.02.20211123.2	Add table AG_SCREENSHOT	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-2126350348	postgres	2022-03-17 00:14:23.69654	1	t
319	2022.02.20211123.3	Add foreign key FK_AG_SCREENSHOT_DATA_BLOB from column SCREENSHOT_PID of table AG_SCREENSHOT to column PID of table AG_DATA	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1566744848	postgres	2022-03-17 00:14:23.702329	1	t
320	2022.02.20211123.4	Add foreign key FK_AG_SCREENSHOT_AG_APPL from column AG_APPL_PID of table AG_SCREENSHOT to column PID of table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-1018885315	postgres	2022-03-17 00:14:23.711323	4	t
321	2022.02.20211123.5	Add column VIDEO_URL on table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-5291836	postgres	2022-03-17 00:14:23.71777	1	t
322	2022.02.20211123.6	Add column VIDEO_URL_STATUS on table AG_APPL	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	2112936735	postgres	2022-03-17 00:14:23.723729	1	t
323	2022.02.20220124.1	Modify column MESSAGE on table AG_NOTE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-703199783	postgres	2022-03-17 00:14:23.729793	1	t
324	2022.02.20220124.2	Add column NOTE_TYPE on table AG_NOTE	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-243272525	postgres	2022-03-17 00:14:23.735768	1	t
325	2022.02.20220124.3	Execute raw sql	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	1776821827	postgres	2022-03-17 00:14:23.741704	1	t
326	2022.02.20220204.1	Add column SOURCE_TRANSACTION_ID on table CDR_AUDIT_EVT	JDBC	ca.uhn.fhir.jpa.migrate.FlywayMigrationTask	-2070341286	postgres	2022-03-17 00:14:23.747745	1	t
\.


--
-- Data for Name: ag_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ag_address (pid, address_line1, address_line2, city, country, postal_code, region, ag_profile_pid) FROM stdin;
\.


--
-- Data for Name: ag_appl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ag_appl (pid, attestation_accepted, confidential, home_url, launch_url, long_desc, app_name, oauth_redirect_url, privacy_policy_url, short_desc, ag_status, terms_of_service_url, version_number, created_by, created_date, last_modified_by, last_modified_date, identifier, seed, video_url, video_url_status, attestation_pid, icon_pid, module_pid, oauth2_client_pid, parent_pid, profile_pid, user_pid) FROM stdin;
\.


--
-- Data for Name: ag_attestation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ag_attestation (pid, archive_date, created_by, created_date, last_modified_by, last_modified_date, title, html_pid, module_pid, plain_html_pid) FROM stdin;
\.


--
-- Data for Name: ag_class; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ag_class (pid, classification, ag_appl_pid) FROM stdin;
\.


--
-- Data for Name: ag_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ag_data (pid, data_lob) FROM stdin;
\.


--
-- Data for Name: ag_document; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ag_document (pid, fileactive, created_by, created_date, last_modified_by, last_modified_date, filedesc, filename, filetype, document_pid, ag_appl_pid) FROM stdin;
\.


--
-- Data for Name: ag_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ag_note (pid, created_by, created_date, last_modified_by, last_modified_date, message, reason, note_type, ag_appl_pid) FROM stdin;
\.


--
-- Data for Name: ag_oauth_redirect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ag_oauth_redirect (pid, oauth_redirect_url, ag_appl_pid) FROM stdin;
\.


--
-- Data for Name: ag_phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ag_phone (pid, country_code, phone_number, phone_type, ag_profile_pid) FROM stdin;
\.


--
-- Data for Name: ag_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ag_profile (pid, archive_date, created_by, created_date, last_modified_by, last_modified_date, business_name, designation, duns_number, full_name, individual, profile_type, website_url, module_pid, user_pid) FROM stdin;
\.


--
-- Data for Name: ag_sandbox_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ag_sandbox_client (pid, seed, module_pid, oauth2_client_pid, user_pid) FROM stdin;
\.


--
-- Data for Name: ag_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ag_scope (pid, scope, ag_appl_pid) FROM stdin;
\.


--
-- Data for Name: ag_screenshot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ag_screenshot (pid, filename, "position", asset_status, screenshot_pid, ag_appl_pid) FROM stdin;
\.


--
-- Data for Name: cdr_audit_evt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_audit_evt (pid, evt_additional_json, auser_type, have_headers, remote_address, source_transaction_id, have_target_modules, have_target_resources, have_target_users, evt_timestamp, type_display, user_pid, client_pid, endpoint_module_pid, type_pid) FROM stdin;
\.


--
-- Data for Name: cdr_audit_evt_header; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_audit_evt_header (pid, evt_header_name, evt_header_value, event_pid) FROM stdin;
\.


--
-- Data for Name: cdr_audit_evt_target_module; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_audit_evt_target_module (pid, event_pid, module_pid) FROM stdin;
\.


--
-- Data for Name: cdr_audit_evt_target_res; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_audit_evt_target_res (pid, req_val_result, res_id, res_version, res_version_str, event_pid, pers_module_pid) FROM stdin;
\.


--
-- Data for Name: cdr_audit_evt_target_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_audit_evt_target_user (pid, user_pid, event_pid) FROM stdin;
\.


--
-- Data for Name: cdr_audit_evt_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_audit_evt_type (pid, codeval, system_url) FROM stdin;
\.


--
-- Data for Name: cdr_cda_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_cda_template (pid, template_description, template_id, template_content, module_pid) FROM stdin;
\.


--
-- Data for Name: cdr_cda_template_param; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_cda_template_param (pid, template_parameter_name, template_pid) FROM stdin;
\.


--
-- Data for Name: cdr_db_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_db_version (db_version, db_init_time) FROM stdin;
V2022_02_R01	2022-03-17 00:15:12.127
\.


--
-- Data for Name: cdr_fhir_searchparam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_fhir_searchparam (pid, sp_base, sp_code, sp_desc, sp_fhir_status, last_updated, last_used, stat_overall_count, sp_path, stat_resource_spread, sp_res_id, sp_sync_status, sp_title, sp_type, buf_unique_resources, buf_unique_values, stat_value_spread, module_pid) FROM stdin;
\.


--
-- Data for Name: cdr_global_gauge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_global_gauge (id, val_double, val_long) FROM stdin;
\.


--
-- Data for Name: cdr_http_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_http_session (pid, ses_attrs, ses_expiry, last_accessed_time, max_inactive, ses_id, module_pid) FROM stdin;
\.


--
-- Data for Name: cdr_metric_gauge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_metric_gauge (gauge_type, intervl, start_time, is_collapsed, gauge_val, modproc_pid) FROM stdin;
5	0	2022-03-17 00:25:00	f	2	8
5	0	2022-03-17 00:25:00	f	2	7
5	0	2022-03-17 00:25:00	f	2	3
6	0	2022-03-17 00:25:00	f	3	3
5	0	2022-03-17 00:25:00	f	2	4
6	0	2022-03-17 00:25:00	f	3	4
8	0	2022-03-17 00:25:00	f	5	5
5	0	2022-03-17 00:25:00	f	2	9
6	0	2022-03-17 00:25:00	f	3	9
0	0	2022-03-17 00:25:00	f	4	1
2	0	2022-03-17 00:25:00	f	2147483648	1
3	0	2022-03-17 00:25:00	f	678428672	1
4	0	2022-03-17 00:25:00	f	364556288	1
1	0	2022-03-17 00:25:00	f	8	1
7	0	2022-03-17 00:25:00	f	1	1
8	0	2022-03-17 00:25:00	f	5	1
0	0	2022-03-17 00:17:00	t	14	1
1	0	2022-03-17 00:15:00	t	400	1
1	0	2022-03-17 00:16:00	t	400	1
1	0	2022-03-17 00:17:00	t	17	1
2	0	2022-03-17 00:15:00	t	2147483648	1
2	0	2022-03-17 00:16:00	t	2147483648	1
2	0	2022-03-17 00:17:00	t	2147483648	1
3	0	2022-03-17 00:15:00	t	678428672	1
3	0	2022-03-17 00:16:00	t	678428672	1
3	0	2022-03-17 00:17:00	t	678428672	1
4	0	2022-03-17 00:15:00	t	442523272	1
4	0	2022-03-17 00:16:00	t	520819808	1
4	0	2022-03-17 00:17:00	t	351273472	1
5	0	2022-03-17 00:15:00	t	2	3
5	0	2022-03-17 00:15:00	t	2	4
5	0	2022-03-17 00:15:00	t	2	7
5	0	2022-03-17 00:15:00	t	2	8
5	0	2022-03-17 00:15:00	t	2	9
5	0	2022-03-17 00:16:00	t	2	3
5	0	2022-03-17 00:16:00	t	2	4
5	0	2022-03-17 00:16:00	t	2	7
5	0	2022-03-17 00:16:00	t	2	8
5	0	2022-03-17 00:16:00	t	2	9
5	0	2022-03-17 00:17:00	t	2	3
5	0	2022-03-17 00:17:00	t	2	4
5	0	2022-03-17 00:17:00	t	2	7
0	0	2022-03-17 00:18:00	t	14	1
0	0	2022-03-17 00:19:00	t	6	1
0	1	2022-03-17 00:10:00	t	14	1
1	0	2022-03-17 00:18:00	t	17	1
1	0	2022-03-17 00:19:00	t	9	1
1	1	2022-03-17 00:10:00	t	17	1
2	0	2022-03-17 00:18:00	t	2147483648	1
2	0	2022-03-17 00:19:00	t	2147483648	1
2	1	2022-03-17 00:10:00	t	2147483648	1
3	0	2022-03-17 00:18:00	t	678428672	1
3	0	2022-03-17 00:19:00	t	678428672	1
3	1	2022-03-17 00:10:00	t	678428672	1
4	0	2022-03-17 00:18:00	t	414389160	1
4	0	2022-03-17 00:19:00	t	476498648	1
4	1	2022-03-17 00:10:00	t	351273472	1
5	0	2022-03-17 00:18:00	t	2	3
5	0	2022-03-17 00:18:00	t	2	4
5	0	2022-03-17 00:18:00	t	2	7
5	0	2022-03-17 00:18:00	t	2	8
5	0	2022-03-17 00:18:00	t	2	9
5	0	2022-03-17 00:19:00	t	2	3
5	0	2022-03-17 00:19:00	t	2	4
5	0	2022-03-17 00:19:00	t	2	7
5	0	2022-03-17 00:19:00	t	2	8
5	0	2022-03-17 00:19:00	t	2	9
5	1	2022-03-17 00:10:00	t	2	3
5	1	2022-03-17 00:10:00	t	2	4
5	1	2022-03-17 00:10:00	t	2	7
5	1	2022-03-17 00:10:00	t	2	8
5	1	2022-03-17 00:10:00	t	2	9
6	0	2022-03-17 00:18:00	t	3	3
6	0	2022-03-17 00:18:00	t	3	4
6	0	2022-03-17 00:18:00	t	3	9
6	0	2022-03-17 00:19:00	t	3	3
6	0	2022-03-17 00:19:00	t	3	4
6	0	2022-03-17 00:19:00	t	3	9
6	1	2022-03-17 00:10:00	t	3	3
6	1	2022-03-17 00:10:00	t	3	4
6	1	2022-03-17 00:10:00	t	3	9
7	0	2022-03-17 00:18:00	t	1	1
7	0	2022-03-17 00:19:00	t	2	1
7	1	2022-03-17 00:10:00	t	1	1
8	0	2022-03-17 00:18:00	t	5	1
5	0	2022-03-17 00:17:00	t	2	8
5	0	2022-03-17 00:17:00	t	2	9
6	0	2022-03-17 00:15:00	t	3	3
6	0	2022-03-17 00:15:00	t	3	4
6	0	2022-03-17 00:15:00	t	3	9
6	0	2022-03-17 00:16:00	t	3	3
6	0	2022-03-17 00:16:00	t	3	4
6	0	2022-03-17 00:16:00	t	3	9
6	0	2022-03-17 00:17:00	t	3	3
6	0	2022-03-17 00:17:00	t	3	4
6	0	2022-03-17 00:17:00	t	3	9
7	0	2022-03-17 00:15:00	t	1	1
7	0	2022-03-17 00:16:00	t	1	1
7	0	2022-03-17 00:17:00	t	1	1
8	0	2022-03-17 00:15:00	t	5	1
8	0	2022-03-17 00:15:00	t	5	5
8	0	2022-03-17 00:16:00	t	5	1
8	0	2022-03-17 00:16:00	t	5	5
8	0	2022-03-17 00:17:00	t	5	1
8	0	2022-03-17 00:17:00	t	5	5
5	0	2022-03-17 00:23:00	f	2	8
5	0	2022-03-17 00:23:00	f	2	7
5	0	2022-03-17 00:23:00	f	2	3
6	0	2022-03-17 00:23:00	f	3	3
5	0	2022-03-17 00:23:00	f	2	4
6	0	2022-03-17 00:23:00	f	3	4
8	0	2022-03-17 00:23:00	f	5	5
5	0	2022-03-17 00:23:00	f	2	9
6	0	2022-03-17 00:23:00	f	3	9
0	0	2022-03-17 00:23:00	f	4	1
2	0	2022-03-17 00:23:00	f	2147483648	1
3	0	2022-03-17 00:23:00	f	678428672	1
4	0	2022-03-17 00:23:00	f	482157600	1
1	0	2022-03-17 00:23:00	f	6	1
7	0	2022-03-17 00:23:00	f	1	1
8	0	2022-03-17 00:23:00	f	5	1
5	0	2022-03-17 00:24:00	f	2	8
5	0	2022-03-17 00:24:00	f	2	7
5	0	2022-03-17 00:24:00	f	2	3
6	0	2022-03-17 00:24:00	f	3	3
5	0	2022-03-17 00:24:00	f	2	4
6	0	2022-03-17 00:24:00	f	3	4
8	0	2022-03-17 00:24:00	f	5	5
5	0	2022-03-17 00:24:00	f	2	9
6	0	2022-03-17 00:24:00	f	3	9
0	0	2022-03-17 00:24:00	f	4	1
2	0	2022-03-17 00:24:00	f	2147483648	1
3	0	2022-03-17 00:24:00	f	678428672	1
4	0	2022-03-17 00:24:00	f	543989784	1
1	0	2022-03-17 00:24:00	f	6	1
7	0	2022-03-17 00:24:00	f	2	1
8	0	2022-03-17 00:24:00	f	4	1
0	1	2022-03-17 00:20:00	f	5	1
5	2	2022-03-17 00:00:00	f	2	7
8	1	2022-03-17 00:20:00	f	5	5
6	1	2022-03-17 00:20:00	f	3	3
5	1	2022-03-17 00:20:00	f	2	4
6	2	2022-03-17 00:00:00	f	3	4
7	2	2022-03-17 00:00:00	f	1	1
6	1	2022-03-17 00:20:00	f	3	4
1	2	2022-03-17 00:00:00	f	17	1
6	2	2022-03-17 00:00:00	f	3	3
2	1	2022-03-17 00:20:00	f	2147483648	1
2	2	2022-03-17 00:00:00	f	2147483648	1
5	2	2022-03-17 00:00:00	f	2	8
8	2	2022-03-17 00:00:00	f	5	5
0	2	2022-03-17 00:00:00	f	14	1
5	1	2022-03-17 00:20:00	f	2	7
6	2	2022-03-17 00:00:00	f	3	9
6	1	2022-03-17 00:20:00	f	3	9
5	1	2022-03-17 00:20:00	f	2	8
3	2	2022-03-17 00:00:00	f	678428672	1
7	1	2022-03-17 00:20:00	f	1	1
5	2	2022-03-17 00:00:00	f	2	3
5	1	2022-03-17 00:20:00	f	2	9
5	2	2022-03-17 00:00:00	f	2	9
1	1	2022-03-17 00:20:00	f	11	1
5	1	2022-03-17 00:20:00	f	2	3
4	2	2022-03-17 00:00:00	f	351273472	1
8	1	2022-03-17 00:20:00	f	5	1
5	2	2022-03-17 00:00:00	f	2	4
8	2	2022-03-17 00:00:00	f	5	1
4	1	2022-03-17 00:20:00	f	421533440	1
3	1	2022-03-17 00:20:00	f	678428672	1
0	0	2022-03-17 00:20:00	t	6	1
0	0	2022-03-17 00:21:00	t	5	1
0	0	2022-03-17 00:22:00	t	5	1
1	0	2022-03-17 00:20:00	t	9	1
1	0	2022-03-17 00:21:00	t	11	1
1	0	2022-03-17 00:22:00	t	11	1
2	0	2022-03-17 00:20:00	t	2147483648	1
2	0	2022-03-17 00:21:00	t	2147483648	1
2	0	2022-03-17 00:22:00	t	2147483648	1
3	0	2022-03-17 00:20:00	t	678428672	1
3	0	2022-03-17 00:21:00	t	678428672	1
3	0	2022-03-17 00:22:00	t	678428672	1
4	0	2022-03-17 00:20:00	t	541459768	1
4	0	2022-03-17 00:21:00	t	359835648	1
4	0	2022-03-17 00:22:00	t	421533440	1
5	0	2022-03-17 00:20:00	t	2	3
5	0	2022-03-17 00:20:00	t	2	4
5	0	2022-03-17 00:20:00	t	2	7
5	0	2022-03-17 00:20:00	t	2	8
5	0	2022-03-17 00:20:00	t	2	9
5	0	2022-03-17 00:21:00	t	2	3
5	0	2022-03-17 00:21:00	t	2	4
5	0	2022-03-17 00:21:00	t	2	7
5	0	2022-03-17 00:21:00	t	2	8
5	0	2022-03-17 00:21:00	t	2	9
5	0	2022-03-17 00:22:00	t	2	3
5	0	2022-03-17 00:22:00	t	2	4
5	0	2022-03-17 00:22:00	t	2	7
5	0	2022-03-17 00:22:00	t	2	8
5	0	2022-03-17 00:22:00	t	2	9
6	0	2022-03-17 00:20:00	t	3	3
6	0	2022-03-17 00:20:00	t	3	4
6	0	2022-03-17 00:20:00	t	3	9
6	0	2022-03-17 00:21:00	t	3	3
6	0	2022-03-17 00:21:00	t	3	4
6	0	2022-03-17 00:21:00	t	3	9
6	0	2022-03-17 00:22:00	t	3	3
6	0	2022-03-17 00:22:00	t	3	4
6	0	2022-03-17 00:22:00	t	3	9
7	0	2022-03-17 00:20:00	t	1	1
7	0	2022-03-17 00:21:00	t	1	1
7	0	2022-03-17 00:22:00	t	1	1
8	0	2022-03-17 00:18:00	t	5	5
8	0	2022-03-17 00:19:00	t	4	1
8	0	2022-03-17 00:19:00	t	5	5
8	0	2022-03-17 00:20:00	t	5	1
8	0	2022-03-17 00:20:00	t	5	5
8	0	2022-03-17 00:21:00	t	5	1
8	0	2022-03-17 00:21:00	t	5	5
8	0	2022-03-17 00:22:00	t	5	1
8	0	2022-03-17 00:22:00	t	5	5
8	1	2022-03-17 00:10:00	t	5	1
8	1	2022-03-17 00:10:00	t	5	5
\.


--
-- Data for Name: cdr_metric_hc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_metric_hc (pid, error_string, healthcheck_type, is_healthy, healthy_string, modproc_pid) FROM stdin;
\.


--
-- Data for Name: cdr_metric_health; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_metric_health (pid, custom_healthcheck_name, error_string, healthcheck_type, is_healthy, healthy_string, modproc_pid) FROM stdin;
1	\N	\N	0	t	Listening: No transactions since started.	8
2	\N	\N	0	t	Listening: No transactions since started.	7
3	\N	\N	0	t	Listening: No transactions since started.	3
4	\N	\N	0	t	Listening: No transactions since started.	4
6	\N	\N	0	t	Listening: No transactions since started.	9
9	\N	\N	4	t	Purged 0 stats in 18ms	1
7	\N	\N	1	t	Acquired connection in 0ms.	1
8	\N	\N	3	t	Collapsed 376 stats in 176ms	1
10	\N	\N	5	t	Heartbeat succeeded in 137ms.	1
11	\N	\N	6	t	Completed with no action in 1ms	1
5	\N	\N	1	t	Acquired connection in 0ms.	5
\.


--
-- Data for Name: cdr_metric_timer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_metric_timer (intervl, start_time, timer_type, is_collapsed, count_val, rate_15_min, first_since_rs, rate_5_min, latency_max, latency_mean, latency_min, modproc_pid, rate_1_min) FROM stdin;
0	2022-03-17 00:25:00	3	f	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:25:00	4	f	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:25:00	5	f	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:25:00	6	f	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:25:00	2	f	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:25:00	3	f	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:25:00	4	f	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:25:00	5	f	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:25:00	6	f	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:25:00	2	f	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:25:00	3	f	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:25:00	4	f	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:25:00	5	f	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:25:00	6	f	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:25:00	2	f	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:25:00	3	f	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:25:00	4	f	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:25:00	5	f	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:25:00	6	f	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:25:00	2	f	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:25:00	2	f	1402	31.434666	f	8.031435	1177	3	1	5	0.11395222
0	2022-03-17 00:25:00	0	f	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:25:00	1	f	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:25:00	0	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:25:00	1	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:25:00	3	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:25:00	4	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:25:00	5	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:25:00	6	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:25:00	2	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:25:00	2	f	0	0	f	0	0	0	0	10	0
0	2022-03-17 00:23:00	4	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:23:00	5	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:23:00	6	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:23:00	2	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:23:00	2	f	0	0	f	0	0	0	0	10	0
0	2022-03-17 00:24:00	3	f	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:24:00	4	f	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:24:00	5	f	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:24:00	6	f	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:24:00	2	f	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:24:00	3	f	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:24:00	4	f	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:24:00	5	f	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:24:00	6	f	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:24:00	2	f	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:24:00	3	f	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:24:00	4	f	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:24:00	5	f	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:24:00	6	f	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:15:00	0	t	0	0	t	0	0	0	0	2	0
0	2022-03-17 00:15:00	0	t	0	0	t	0	0	0	0	9	0
0	2022-03-17 00:15:00	1	t	0	0	t	0	0	0	0	2	0
0	2022-03-17 00:15:00	1	t	0	0	t	0	0	0	0	9	0
0	2022-03-17 00:15:00	2	t	0	0	t	0	0	0	0	8	0
0	2022-03-17 00:15:00	2	t	0	0	t	0	0	0	0	7	0
0	2022-03-17 00:15:00	2	t	0	0	t	0	0	0	0	3	0
0	2022-03-17 00:15:00	2	t	0	0	t	0	0	0	0	4	0
0	2022-03-17 00:15:00	2	t	1333	61.117367	t	58.609875	1177	5	1	5	45.183113
0	2022-03-17 00:15:00	2	t	0	0	t	0	0	0	0	9	0
0	2022-03-17 00:15:00	2	t	0	0	t	0	0	0	0	10	0
0	2022-03-17 00:15:00	3	t	0	0	t	0	0	0	0	8	0
0	2022-03-17 00:15:00	3	t	0	0	t	0	0	0	0	7	0
0	2022-03-17 00:15:00	3	t	0	0	t	0	0	0	0	3	0
0	2022-03-17 00:15:00	3	t	0	0	t	0	0	0	0	4	0
0	2022-03-17 00:15:00	3	t	0	0	t	0	0	0	0	9	0
0	2022-03-17 00:15:00	4	t	0	0	t	0	0	0	0	8	0
0	2022-03-17 00:15:00	4	t	0	0	t	0	0	0	0	7	0
0	2022-03-17 00:15:00	4	t	0	0	t	0	0	0	0	3	0
0	2022-03-17 00:15:00	4	t	0	0	t	0	0	0	0	4	0
0	2022-03-17 00:15:00	4	t	0	0	t	0	0	0	0	9	0
0	2022-03-17 00:15:00	5	t	0	0	t	0	0	0	0	8	0
0	2022-03-17 00:15:00	5	t	0	0	t	0	0	0	0	7	0
0	2022-03-17 00:15:00	5	t	0	0	t	0	0	0	0	3	0
0	2022-03-17 00:15:00	5	t	0	0	t	0	0	0	0	4	0
0	2022-03-17 00:15:00	5	t	0	0	t	0	0	0	0	9	0
0	2022-03-17 00:15:00	6	t	0	0	t	0	0	0	0	8	0
0	2022-03-17 00:15:00	6	t	0	0	t	0	0	0	0	7	0
0	2022-03-17 00:15:00	6	t	0	0	t	0	0	0	0	3	0
0	2022-03-17 00:15:00	6	t	0	0	t	0	0	0	0	4	0
0	2022-03-17 00:15:00	6	t	0	0	t	0	0	0	0	9	0
0	2022-03-17 00:16:00	0	t	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:16:00	0	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:16:00	1	t	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:16:00	1	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:16:00	2	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:16:00	2	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:16:00	2	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:16:00	2	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:16:00	2	t	1340	57.183243	f	48.00683	1177	5	1	5	16.694971
0	2022-03-17 00:16:00	2	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:16:00	2	t	0	0	f	0	0	0	0	10	0
0	2022-03-17 00:16:00	3	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:16:00	3	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:16:00	3	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:16:00	3	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:16:00	3	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:16:00	4	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:16:00	4	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:16:00	4	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:16:00	4	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:16:00	4	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:16:00	5	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:16:00	5	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:16:00	5	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:16:00	5	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:16:00	5	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:16:00	6	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:16:00	6	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:16:00	6	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:16:00	6	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:16:00	6	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:17:00	0	t	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:17:00	0	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:17:00	1	t	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:17:00	1	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:17:00	2	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:17:00	2	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:17:00	2	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:17:00	2	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:17:00	2	t	1347	53.502857	f	39.325893	1177	5	1	5	6.217029
0	2022-03-17 00:17:00	2	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:17:00	2	t	0	0	f	0	0	0	0	10	0
0	2022-03-17 00:17:00	3	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:17:00	3	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:17:00	3	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:17:00	3	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:17:00	3	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:17:00	4	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:17:00	4	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:17:00	4	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:17:00	4	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:17:00	4	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:17:00	5	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:17:00	5	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:17:00	5	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:17:00	5	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:17:00	5	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:17:00	6	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:17:00	6	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:17:00	6	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:17:00	6	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:17:00	6	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:23:00	3	f	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:23:00	4	f	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:23:00	5	f	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:23:00	6	f	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:23:00	2	f	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:23:00	3	f	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:23:00	4	f	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:23:00	5	f	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:23:00	6	f	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:23:00	2	f	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:23:00	3	f	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:23:00	4	f	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:23:00	5	f	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:23:00	6	f	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:23:00	2	f	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:23:00	3	f	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:23:00	4	f	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:23:00	5	f	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:23:00	6	f	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:23:00	2	f	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:23:00	2	f	1388	35.901608	f	11.924435	1177	3	1	5	0.12904161
0	2022-03-17 00:23:00	0	f	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:23:00	1	f	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:23:00	0	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:23:00	1	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:23:00	3	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:24:00	2	f	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:24:00	3	f	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:24:00	4	f	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:24:00	5	f	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:24:00	6	f	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:24:00	2	f	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:24:00	2	f	1395	33.593735	f	9.784128	1177	3	1	5	0.122764036
0	2022-03-17 00:24:00	0	f	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:24:00	1	f	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:24:00	0	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:24:00	1	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:24:00	3	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:24:00	4	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:24:00	5	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:24:00	6	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:24:00	2	f	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:24:00	2	f	0	0	f	0	0	0	0	10	0
1	2022-03-17 00:20:00	4	f	0	0	f	0	0	0	0	7	0
1	2022-03-17 00:20:00	0	f	0	0	f	0	0	0	0	2	0
1	2022-03-17 00:20:00	4	f	0	0	f	0	0	0	0	8	0
1	2022-03-17 00:20:00	2	f	0	0	f	0	0	0	0	7	0
2	2022-03-17 00:00:00	2	f	1347	53.502857	t	39.325893	1177	5	1	5	6.217029
2	2022-03-17 00:00:00	6	f	0	0	t	0	0	0	0	9	0
1	2022-03-17 00:20:00	6	f	0	0	f	0	0	0	0	9	0
1	2022-03-17 00:20:00	4	f	0	0	f	0	0	0	0	9	0
2	2022-03-17 00:00:00	0	f	0	0	t	0	0	0	0	2	0
2	2022-03-17 00:00:00	4	f	0	0	t	0	0	0	0	7	0
2	2022-03-17 00:00:00	6	f	0	0	t	0	0	0	0	8	0
1	2022-03-17 00:20:00	1	f	0	0	f	0	0	0	0	2	0
1	2022-03-17 00:20:00	6	f	0	0	f	0	0	0	0	8	0
2	2022-03-17 00:00:00	6	f	0	0	t	0	0	0	0	7	0
2	2022-03-17 00:00:00	1	f	0	0	t	0	0	0	0	2	0
2	2022-03-17 00:00:00	2	f	0	0	t	0	0	0	0	4	0
2	2022-03-17 00:00:00	5	f	0	0	t	0	0	0	0	9	0
2	2022-03-17 00:00:00	4	f	0	0	t	0	0	0	0	8	0
1	2022-03-17 00:20:00	2	f	1381	38.36859	f	14.53874	1177	3	1	5	0.15224545
1	2022-03-17 00:20:00	2	f	0	0	f	0	0	0	0	4	0
2	2022-03-17 00:00:00	2	f	0	0	t	0	0	0	0	3	0
2	2022-03-17 00:00:00	3	f	0	0	t	0	0	0	0	9	0
2	2022-03-17 00:00:00	4	f	0	0	t	0	0	0	0	3	0
1	2022-03-17 00:20:00	2	f	0	0	f	0	0	0	0	3	0
1	2022-03-17 00:20:00	4	f	0	0	f	0	0	0	0	4	0
2	2022-03-17 00:00:00	4	f	0	0	t	0	0	0	0	4	0
1	2022-03-17 00:20:00	3	f	0	0	f	0	0	0	0	8	0
1	2022-03-17 00:20:00	6	f	0	0	f	0	0	0	0	4	0
2	2022-03-17 00:00:00	6	f	0	0	t	0	0	0	0	3	0
1	2022-03-17 00:20:00	0	f	0	0	f	0	0	0	0	9	0
1	2022-03-17 00:20:00	3	f	0	0	f	0	0	0	0	7	0
1	2022-03-17 00:20:00	6	f	0	0	f	0	0	0	0	3	0
2	2022-03-17 00:00:00	5	f	0	0	t	0	0	0	0	4	0
2	2022-03-17 00:00:00	0	f	0	0	t	0	0	0	0	9	0
1	2022-03-17 00:20:00	5	f	0	0	f	0	0	0	0	4	0
2	2022-03-17 00:00:00	5	f	0	0	t	0	0	0	0	3	0
2	2022-03-17 00:00:00	3	f	0	0	t	0	0	0	0	8	0
1	2022-03-17 00:20:00	1	f	0	0	f	0	0	0	0	9	0
2	2022-03-17 00:00:00	1	f	0	0	t	0	0	0	0	9	0
1	2022-03-17 00:20:00	4	f	0	0	f	0	0	0	0	3	0
1	2022-03-17 00:20:00	5	f	0	0	f	0	0	0	0	3	0
1	2022-03-17 00:20:00	3	f	0	0	f	0	0	0	0	9	0
2	2022-03-17 00:00:00	3	f	0	0	t	0	0	0	0	7	0
2	2022-03-17 00:00:00	3	f	0	0	t	0	0	0	0	3	0
2	2022-03-17 00:00:00	2	f	0	0	t	0	0	0	0	10	0
1	2022-03-17 00:20:00	5	f	0	0	f	0	0	0	0	9	0
1	2022-03-17 00:20:00	3	f	0	0	f	0	0	0	0	4	0
2	2022-03-17 00:00:00	4	f	0	0	t	0	0	0	0	9	0
2	2022-03-17 00:00:00	5	f	0	0	t	0	0	0	0	8	0
2	2022-03-17 00:00:00	5	f	0	0	t	0	0	0	0	7	0
1	2022-03-17 00:20:00	2	f	0	0	f	0	0	0	0	10	0
2	2022-03-17 00:00:00	2	f	0	0	t	0	0	0	0	9	0
1	2022-03-17 00:20:00	5	f	0	0	f	0	0	0	0	8	0
1	2022-03-17 00:20:00	3	f	0	0	f	0	0	0	0	3	0
1	2022-03-17 00:20:00	6	f	0	0	f	0	0	0	0	7	0
2	2022-03-17 00:00:00	6	f	0	0	t	0	0	0	0	4	0
2	2022-03-17 00:00:00	2	f	0	0	t	0	0	0	0	8	0
1	2022-03-17 00:20:00	2	f	0	0	f	0	0	0	0	9	0
2	2022-03-17 00:00:00	3	f	0	0	t	0	0	0	0	4	0
1	2022-03-17 00:20:00	2	f	0	0	f	0	0	0	0	8	0
1	2022-03-17 00:20:00	5	f	0	0	f	0	0	0	0	7	0
2	2022-03-17 00:00:00	2	f	0	0	t	0	0	0	0	7	0
0	2022-03-17 00:18:00	0	t	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:18:00	0	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:18:00	1	t	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:18:00	1	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:18:00	2	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:18:00	2	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:18:00	2	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:18:00	2	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:18:00	2	t	0	0	f	0	0	0	0	10	0
0	2022-03-17 00:18:00	2	t	1353	50.058727	f	32.215294	1177	5	1	5	2.347697
0	2022-03-17 00:18:00	2	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:18:00	3	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:18:00	3	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:18:00	3	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:18:00	3	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:18:00	3	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:18:00	4	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:18:00	4	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:18:00	4	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:18:00	4	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:18:00	4	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:18:00	5	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:18:00	5	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:18:00	5	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:18:00	5	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:18:00	5	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:18:00	6	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:18:00	6	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:18:00	6	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:18:00	6	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:18:00	6	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:19:00	0	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:19:00	0	t	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:19:00	1	t	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:19:00	1	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:19:00	2	t	0	0	f	0	0	0	0	10	0
0	2022-03-17 00:19:00	2	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:19:00	2	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:19:00	2	t	1360	46.837765	f	26.39638	1177	4	1	5	0.9306432
0	2022-03-17 00:19:00	2	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:19:00	2	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:19:00	2	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:19:00	3	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:19:00	3	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:19:00	3	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:19:00	3	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:19:00	3	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:19:00	4	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:19:00	4	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:19:00	4	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:19:00	4	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:19:00	4	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:19:00	5	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:19:00	5	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:19:00	5	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:19:00	5	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:19:00	5	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:19:00	6	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:19:00	6	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:19:00	6	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:19:00	6	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:19:00	6	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:20:00	0	t	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:20:00	0	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:20:00	1	t	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:20:00	1	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:20:00	2	t	0	0	f	0	0	0	0	10	0
0	2022-03-17 00:20:00	2	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:20:00	2	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:20:00	2	t	1367	43.82454	f	21.632349	1177	4	1	5	0.41049793
0	2022-03-17 00:20:00	2	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:20:00	2	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:20:00	2	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:20:00	3	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:20:00	3	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:20:00	3	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:20:00	3	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:20:00	3	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:20:00	4	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:20:00	4	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:20:00	4	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:20:00	4	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:20:00	4	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:20:00	5	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:20:00	5	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:20:00	5	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:20:00	5	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:20:00	5	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:20:00	6	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:20:00	6	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:20:00	6	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:20:00	6	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:20:00	6	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:21:00	0	t	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:21:00	0	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:21:00	1	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:21:00	1	t	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:21:00	2	t	0	0	f	0	0	0	0	10	0
0	2022-03-17 00:21:00	2	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:21:00	2	t	1374	41.00566	f	17.731987	1177	4	1	5	0.2205171
0	2022-03-17 00:21:00	2	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:21:00	2	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:21:00	2	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:21:00	2	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:21:00	3	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:21:00	3	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:21:00	3	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:21:00	3	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:21:00	3	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:21:00	4	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:21:00	4	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:21:00	4	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:21:00	4	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:21:00	4	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:21:00	5	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:21:00	5	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:21:00	5	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:21:00	5	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:21:00	5	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:21:00	6	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:21:00	6	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:21:00	6	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:21:00	6	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:21:00	6	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:22:00	0	t	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:22:00	0	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:22:00	1	t	0	0	f	0	0	0	0	2	0
0	2022-03-17 00:22:00	1	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:22:00	2	t	1381	38.36859	f	14.53874	1177	3	1	5	0.15224545
0	2022-03-17 00:22:00	2	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:22:00	2	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:22:00	2	t	0	0	f	0	0	0	0	10	0
0	2022-03-17 00:22:00	2	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:22:00	2	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:22:00	2	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:22:00	3	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:22:00	3	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:22:00	3	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:22:00	3	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:22:00	3	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:22:00	4	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:22:00	4	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:22:00	4	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:22:00	4	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:22:00	4	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:22:00	5	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:22:00	5	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:22:00	5	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:22:00	5	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:22:00	5	t	0	0	f	0	0	0	0	4	0
0	2022-03-17 00:22:00	6	t	0	0	f	0	0	0	0	8	0
0	2022-03-17 00:22:00	6	t	0	0	f	0	0	0	0	3	0
0	2022-03-17 00:22:00	6	t	0	0	f	0	0	0	0	7	0
0	2022-03-17 00:22:00	6	t	0	0	f	0	0	0	0	9	0
0	2022-03-17 00:22:00	6	t	0	0	f	0	0	0	0	4	0
1	2022-03-17 00:10:00	0	t	0	0	t	0	0	0	0	9	0
1	2022-03-17 00:10:00	0	t	0	0	t	0	0	0	0	2	0
1	2022-03-17 00:10:00	1	t	0	0	t	0	0	0	0	9	0
1	2022-03-17 00:10:00	1	t	0	0	t	0	0	0	0	2	0
1	2022-03-17 00:10:00	2	t	0	0	t	0	0	0	0	3	0
1	2022-03-17 00:10:00	2	t	0	0	t	0	0	0	0	4	0
1	2022-03-17 00:10:00	2	t	0	0	t	0	0	0	0	9	0
1	2022-03-17 00:10:00	2	t	1360	46.837765	t	26.39638	1177	4	1	5	0.9306432
1	2022-03-17 00:10:00	2	t	0	0	t	0	0	0	0	10	0
1	2022-03-17 00:10:00	2	t	0	0	t	0	0	0	0	7	0
1	2022-03-17 00:10:00	2	t	0	0	t	0	0	0	0	8	0
1	2022-03-17 00:10:00	3	t	0	0	t	0	0	0	0	3	0
1	2022-03-17 00:10:00	3	t	0	0	t	0	0	0	0	9	0
1	2022-03-17 00:10:00	3	t	0	0	t	0	0	0	0	4	0
1	2022-03-17 00:10:00	3	t	0	0	t	0	0	0	0	8	0
1	2022-03-17 00:10:00	3	t	0	0	t	0	0	0	0	7	0
1	2022-03-17 00:10:00	4	t	0	0	t	0	0	0	0	9	0
1	2022-03-17 00:10:00	4	t	0	0	t	0	0	0	0	8	0
1	2022-03-17 00:10:00	4	t	0	0	t	0	0	0	0	4	0
1	2022-03-17 00:10:00	4	t	0	0	t	0	0	0	0	3	0
1	2022-03-17 00:10:00	4	t	0	0	t	0	0	0	0	7	0
1	2022-03-17 00:10:00	5	t	0	0	t	0	0	0	0	3	0
1	2022-03-17 00:10:00	5	t	0	0	t	0	0	0	0	4	0
1	2022-03-17 00:10:00	5	t	0	0	t	0	0	0	0	8	0
1	2022-03-17 00:10:00	5	t	0	0	t	0	0	0	0	9	0
1	2022-03-17 00:10:00	5	t	0	0	t	0	0	0	0	7	0
1	2022-03-17 00:10:00	6	t	0	0	t	0	0	0	0	9	0
1	2022-03-17 00:10:00	6	t	0	0	t	0	0	0	0	3	0
1	2022-03-17 00:10:00	6	t	0	0	t	0	0	0	0	4	0
1	2022-03-17 00:10:00	6	t	0	0	t	0	0	0	0	8	0
1	2022-03-17 00:10:00	6	t	0	0	t	0	0	0	0	7	0
\.


--
-- Data for Name: cdr_module; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_module (pid, deleted, module_disabled, module_id, portval, node_pid, prototype_pid) FROM stdin;
1	f	f	clustermgr	\N	1	1
2	f	f	local_security	\N	1	2
3	f	f	admin_web	9100	1	3
4	f	f	admin_json	9000	1	4
5	f	f	persistence	\N	1	5
6	f	f	subscription	\N	1	6
7	f	f	fhir_endpoint	8000	1	7
8	f	f	fhirweb_endpoint	8001	1	8
9	f	f	smart_auth	9200	1	9
10	f	f	package_registry	8002	1	10
\.


--
-- Data for Name: cdr_module_cfg_prop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_module_cfg_prop (pid, value_string, value_extended, module_pid, prototype_pid) FROM stdin;
1	#{env['POSTGRES_PASSWORD']}	\N	1	36
2	false	\N	1	20
3	true	\N	1	54
4	false	\N	1	51
5	10000	\N	1	56
6	4	\N	1	4
7	UPDATE	\N	1	38
8	false	\N	1	49
9	PLAINTEXT	\N	1	26
10	true	\N	1	53
11	false	\N	1	12
12	30	\N	1	44
13	31	\N	1	61
14	true	\N	1	52
15	90	\N	1	59
16	Content-Type,Host	\N	1	13
17	localhost:9092	\N	1	15
18	25	\N	1	64
19	365	\N	1	62
20	false	\N	1	48
21	0	\N	1	40
22	false	\N	1	67
23	15000	\N	1	1
24	8	\N	1	42
25	false	\N	1	14
26	jdbc:postgresql://postgresdb:5432/#{env['POSTGRES_DB']}	\N	1	34
27	false	\N	1	46
28	false	\N	1	39
29	true	\N	1	55
30	60	\N	1	45
31	localhost	\N	1	63
32	60000	\N	1	2
33	300000	\N	1	3
34	true	\N	1	11
35	smilecdr	\N	1	16
36	NONE	\N	1	37
37	keystore/server.truststore.jks	\N	1	21
38	8	\N	1	41
39	300	\N	1	50
40	#{env['POSTGRES_USER']}	\N	1	35
41	true	\N	1	47
42	POSTGRES_9_4	\N	1	33
43	true	\N	1	5
44	keystore/server.keystore.jks	\N	1	23
45	false	\N	1	18
46	7	\N	1	60
47	EMBEDDED_ACTIVEMQ	\N	1	6
48	\N	\N	1	22
49	\N	\N	1	30
50	\N	\N	1	7
51	\N	\N	1	17
52	\N	\N	1	58
53	\N	\N	1	24
54	\N	\N	1	32
55	\N	\N	1	66
56	\N	\N	1	25
57	\N	\N	1	9
58	\N	\N	1	28
59	\N	\N	1	29
60	\N	\N	1	43
61	\N	\N	1	10
62	\N	\N	1	19
63	\N	\N	1	27
64	\N	\N	1	65
65	\N	\N	1	8
66	\N	\N	1	31
67	\N	\N	1	57
68	false	\N	2	71
69	true	\N	2	72
70	Smile CDR	\N	2	78
71	false	\N	2	81
72	5	\N	2	80
73	false	\N	2	73
74	true	\N	2	69
75	10	\N	2	79
76	classpath:/config_seeding/users.json	\N	2	70
77	\N	\N	2	77
78	\N	\N	2	84
79	\N	\N	2	68
80	\N	\N	2	74
81	\N	\N	2	75
82	\N	\N	2	82
83	\N	\N	2	83
84	\N	\N	2	76
85	30	\N	3	104
86	5	\N	3	97
87	/	\N	3	87
88	/endpoint-health	\N	3	88
89	30000	\N	3	102
90	false	\N	3	90
91	0.0.0.0	\N	3	86
92	false	\N	3	111
93	false	\N	3	92
94	false	\N	3	95
95	false	\N	3	93
96	9100	\N	3	85
97	10	\N	3	98
98	DEFAULT_HIDDEN	\N	3	119
99	false	\N	3	89
100	8	\N	3	101
101	false	\N	3	94
102	60000	\N	3	105
103	false	\N	3	103
104	8	\N	3	100
105	false	\N	3	112
106	false	\N	3	120
107	\N	\N	3	91
108	\N	\N	3	117
109	\N	\N	3	96
110	\N	\N	3	107
111	\N	\N	3	115
112	\N	\N	3	118
113	\N	\N	3	106
114	\N	\N	3	99
115	\N	\N	3	109
116	\N	\N	3	121
117	\N	\N	3	116
118	\N	\N	3	114
119	\N	\N	3	108
120	\N	\N	3	113
121	\N	\N	3	110
122	/endpoint-health	\N	4	125
123	30000	\N	4	139
124	false	\N	4	127
125	0.0.0.0	\N	4	123
126	false	\N	4	161
127	false	\N	4	132
128	false	\N	4	130
129	*	\N	4	164
130	8	\N	4	138
131	false	\N	4	131
132	ANONYMOUS	\N	4	157
133	60000	\N	4	142
134	8	\N	4	137
135	false	\N	4	149
136	false	\N	4	162
137	30	\N	4	141
138	5	\N	4	134
139	/	\N	4	124
140	false	\N	4	160
141	true	\N	4	158
142	false	\N	4	148
143	false	\N	4	129
144	9000	\N	4	122
145	10	\N	4	135
146	false	\N	4	126
147	true	\N	4	156
148	false	\N	4	163
149	false	\N	4	140
150	Smile CDR	\N	4	159
151	\N	\N	4	165
152	\N	\N	4	128
153	\N	\N	4	154
154	\N	\N	4	133
155	\N	\N	4	144
156	\N	\N	4	152
157	\N	\N	4	155
158	\N	\N	4	143
159	\N	\N	4	136
160	\N	\N	4	146
161	\N	\N	4	166
162	\N	\N	4	153
163	\N	\N	4	151
164	\N	\N	4	145
165	\N	\N	4	150
166	\N	\N	4	147
167	true	\N	5	274
168	false	\N	5	196
169	false	\N	5	169
170	UPDATE	\N	5	234
171	false	\N	5	245
172	false	\N	5	282
173	ENABLED	\N	5	322
174	true	\N	5	213
175	60000	\N	5	301
176	false	\N	5	270
177	SOURCE_URI_AND_REQUEST_ID	\N	5	286
178	true	\N	5	256
179	30	\N	5	228
180	true	\N	5	264
181	800	\N	5	306
182	false	\N	5	312
183	false	\N	5	199
184	false	\N	5	226
185	true	\N	5	269
186	NOT_ALLOWED	\N	5	203
187	false	\N	5	253
188	50	\N	5	185
189	http	\N	5	182
190	false	\N	5	211
191	false	\N	5	283
192	true	\N	5	243
193	false	\N	5	167
194	false	\N	5	273
195	240	\N	5	214
196	true	\N	5	266
197	8	\N	5	227
198	./database/lucene_fhir_persistence	\N	5	180
199	#{env['POSTGRES_PASSWORD']}	\N	5	232
200	true	\N	5	267
201	false	\N	5	299
202	30	\N	5	240
203	false	\N	5	293
204	true	\N	5	284
205	10000	\N	5	208
206	true	\N	5	200
207	true	\N	5	281
208	false	\N	5	314
209	800	\N	5	304
210	http://localhost:9090	\N	5	181
211	false	\N	5	265
212	MANUAL	\N	5	201
213	8	\N	5	238
214	false	\N	5	298
215	4	\N	5	315
216	false	\N	5	194
217	false	\N	5	235
218	true	\N	5	206
219	60	\N	5	241
220	false	\N	5	324
221	NONE	\N	5	233
222	false	\N	5	168
223	false	\N	5	195
224	DISABLED	\N	5	313
225	NON_VERSIONED	\N	5	287
226	ENABLED	\N	5	319
227	NAMED	\N	5	205
228	false	\N	5	176
229	250	\N	5	186
230	true	\N	5	171
231	2	\N	5	172
232	false	\N	5	170
233	false	\N	5	317
234	DISABLED	\N	5	296
235	false	\N	5	263
236	false	\N	5	244
237	10000	\N	5	311
238	0	\N	5	316
239	NOT_VALIDATED	\N	5	217
240	false	\N	5	254
241	false	\N	5	198
242	true	\N	5	308
243	false	\N	5	260
244	false	\N	5	290
245	false	\N	5	220
246	2	\N	5	251
247	false	\N	5	224
248	60	\N	5	302
249	false	\N	5	285
250	false	\N	5	272
251	300	\N	5	246
252	false	\N	5	271
253	#{env['POSTGRES_USER']}	\N	5	231
254	2	\N	5	307
255	false	\N	5	197
256	104857600	\N	5	209
257	false	\N	5	309
258	true	\N	5	275
259	10	\N	5	212
260	NEVER_INLINE	\N	5	249
261	false	\N	5	192
262	ENABLED	\N	5	318
263	false	\N	5	255
264	ENABLED	\N	5	320
265	ALL_REQUESTS	\N	5	268
266	60	\N	5	288
267	DATABASE	\N	5	187
268	false	\N	5	278
269	0	\N	5	236
270	jdbc:postgresql://postgresdb:5432/#{env['CDR_DB_NAME']}	\N	5	230
271	ALPHANUMERIC	\N	5	280
272	2	\N	5	305
273	GENERATE_ERROR	\N	5	218
274	5	\N	5	250
275	false	\N	5	242
276	true	\N	5	294
277	false	\N	5	300
278	LUCENE_DISK	\N	5	177
279	DISABLED	\N	5	295
280	false	\N	5	277
281	8	\N	5	237
282	SEQUENTIAL_NUMERIC	\N	5	279
283	ENABLED	\N	5	321
284	true	\N	5	291
285	POSTGRES_9_4	\N	5	229
286	false	\N	5	252
287	DATABASE	\N	5	207
288	false	\N	5	216
289	METAPHONE	\N	5	191
290	\N	\N	5	183
291	\N	\N	5	261
292	\N	\N	5	289
293	\N	\N	5	178
294	\N	\N	5	258
295	\N	\N	5	193
296	\N	\N	5	223
297	\N	\N	5	189
298	\N	\N	5	239
299	\N	\N	5	204
300	\N	\N	5	247
301	\N	\N	5	323
302	\N	\N	5	179
303	\N	\N	5	219
304	\N	\N	5	175
305	\N	\N	5	174
306	\N	\N	5	210
307	\N	\N	5	222
308	\N	\N	5	259
309	\N	\N	5	190
310	\N	\N	5	257
311	\N	\N	5	292
312	\N	\N	5	184
313	\N	\N	5	225
314	\N	\N	5	173
315	\N	\N	5	215
316	\N	\N	5	262
317	\N	\N	5	297
318	\N	\N	5	310
319	\N	\N	5	221
320	\N	\N	5	248
321	\N	\N	5	303
322	\N	\N	5	188
323	\N	\N	5	276
324	\N	\N	5	202
325	noreply@unknown.com	\N	6	326
326	SUBSCRIPTION_ID	\N	6	325
327	\N	\N	6	327
328	NONE	\N	7	390
329	false	\N	7	341
330	false	\N	7	347
331	false	\N	7	396
332	false	\N	7	337
333	false	\N	7	361
334	false	\N	7	340
335	FHIR Endpoint powered by Smile CDR	\N	7	350
336	false	\N	7	333
337	http://localhost:8000	\N	7	328
338	false	\N	7	343
339	8	\N	7	369
340	false	\N	7	362
341	ANONYMOUS	\N	7	392
342	60000	\N	7	373
343	8	\N	7	368
344	false	\N	7	332
345	false	\N	7	380
346	/	\N	7	355
347	false	\N	7	379
348	false	\N	7	360
349	8000	\N	7	353
350	false	\N	7	357
351	true	\N	7	391
352	true	\N	7	398
353	true	\N	7	352
354	false	\N	7	389
355	/endpoint-health	\N	7	356
356	true	\N	7	336
357	false	\N	7	388
358	ERROR	\N	7	387
359	true	\N	7	329
360	30000	\N	7	370
361	false	\N	7	358
362	0.0.0.0	\N	7	354
363	false	\N	7	363
364	true	\N	7	338
365	*	\N	7	399
366	REPRESENTATION	\N	7	331
367	false	\N	7	339
368	false	\N	7	397
369	2	\N	7	365
370	30	\N	7	372
371	false	\N	7	395
372	false	\N	7	348
373	true	\N	7	393
374	false	\N	7	335
375	false	\N	7	342
376	10	\N	7	366
377	JSON	\N	7	330
378	Smile CDR	\N	7	394
379	false	\N	7	371
380	false	\N	7	344
381	\N	\N	7	359
382	\N	\N	7	364
383	\N	\N	7	383
384	\N	\N	7	386
385	\N	\N	7	374
386	\N	\N	7	377
387	\N	\N	7	384
388	\N	\N	7	376
389	\N	\N	7	381
390	\N	\N	7	351
391	\N	\N	7	334
392	\N	\N	7	378
393	\N	\N	7	345
394	\N	\N	7	400
395	\N	\N	7	385
396	\N	\N	7	346
397	\N	\N	7	375
398	\N	\N	7	367
399	\N	\N	7	349
400	\N	\N	7	401
401	\N	\N	7	382
402	2	\N	8	415
403	30	\N	8	422
404	/	\N	8	405
405	/endpoint-health	\N	8	406
406	30000	\N	8	420
407	false	\N	8	408
408	0.0.0.0	\N	8	404
409	false	\N	8	429
410	false	\N	8	410
411	false	\N	8	413
412	false	\N	8	411
413	8001	\N	8	403
414	10	\N	8	416
415	false	\N	8	407
416	8	\N	8	419
417	false	\N	8	437
418	false	\N	8	412
419	ANONYMOUS	\N	8	438
420	60000	\N	8	423
421	false	\N	8	421
422	8	\N	8	418
423	false	\N	8	430
424	false	\N	8	439
425	\N	\N	8	409
426	\N	\N	8	435
427	\N	\N	8	414
428	\N	\N	8	425
429	\N	\N	8	433
430	\N	\N	8	436
431	\N	\N	8	424
432	\N	\N	8	417
433	\N	\N	8	427
434	\N	\N	8	440
435	\N	\N	8	434
436	\N	\N	8	402
437	\N	\N	8	432
438	\N	\N	8	426
439	\N	\N	8	431
440	\N	\N	8	428
441	launch-ehr\nclient-public\nclient-confidential-symmetric\ncontext-ehr-patient\ncontext-standalone-patient\nsso-openid-connect\npermission-patient\nlaunch-standalone\npermission-offline	\N	9	443
442	/endpoint-health	\N	9	454
443	false	\N	9	513
444	false	\N	9	444
445	30000	\N	9	468
446	false	\N	9	456
447	0.0.0.0	\N	9	452
448	http://localhost:9200	\N	9	485
449	false	\N	9	461
450	false	\N	9	459
451	*	\N	9	500
452	30	\N	9	510
453	false	\N	9	448
454	8	\N	9	467
455	openid fhirUser	\N	9	447
456	false	\N	9	460
457	BCRYPT_12_ROUND	\N	9	441
458	60000	\N	9	471
459	8	\N	9	466
460	false	\N	9	478
461	3000	\N	9	507
462	30	\N	9	470
463	5	\N	9	463
464	/	\N	9	453
465	false	\N	9	502
466	false	\N	9	477
467	false	\N	9	458
468	classpath:/smilecdr-demo.jwks	\N	9	486
469	true	\N	9	445
470	9200	\N	9	451
471	10	\N	9	464
472	false	\N	9	455
473	false	\N	9	499
474	false	\N	9	469
475	true	\N	9	446
476	\N	\N	9	457
477	\N	\N	9	462
478	\N	\N	9	481
479	\N	\N	9	484
480	\N	\N	9	489
481	\N	\N	9	490
482	\N	\N	9	472
483	\N	\N	9	475
484	\N	\N	9	511
485	\N	\N	9	482
486	\N	\N	9	487
487	\N	\N	9	496
488	\N	\N	9	492
489	\N	\N	9	474
490	\N	\N	9	479
491	\N	\N	9	476
492	\N	\N	9	509
493	\N	\N	9	504
494	\N	\N	9	505
495	\N	\N	9	442
496	\N	\N	9	488
497	\N	\N	9	501
498	\N	\N	9	483
499	\N	\N	9	494
500	\N	\N	9	495
501	\N	\N	9	473
502	\N	\N	9	512
503	\N	\N	9	465
504	\N	\N	9	450
505	\N	\N	9	508
506	\N	\N	9	449
507	\N	\N	9	493
508	\N	\N	9	498
509	\N	\N	9	480
510	\N	\N	9	497
511	\N	\N	9	491
512	\N	\N	9	506
513	\N	\N	9	503
514	/endpoint-health	\N	10	517
515	30000	\N	10	531
516	false	\N	10	519
517	0.0.0.0	\N	10	515
518	false	\N	10	556
519	false	\N	10	524
520	false	\N	10	522
521	*	\N	10	549
522	8	\N	10	530
523	false	\N	10	523
524	ANONYMOUS	\N	10	552
525	60000	\N	10	534
526	8	\N	10	529
527	false	\N	10	541
528	false	\N	10	557
529	30	\N	10	533
530	5	\N	10	526
531	false	\N	10	555
532	/	\N	10	516
533	true	\N	10	553
534	false	\N	10	540
535	false	\N	10	521
536	8002	\N	10	514
537	10	\N	10	527
538	false	\N	10	518
539	true	\N	10	551
540	false	\N	10	548
541	Smile CDR	\N	10	554
542	false	\N	10	532
543	\N	\N	10	520
544	\N	\N	10	550
545	\N	\N	10	546
546	\N	\N	10	525
547	\N	\N	10	536
548	\N	\N	10	544
549	\N	\N	10	547
550	\N	\N	10	535
551	\N	\N	10	528
552	\N	\N	10	538
553	\N	\N	10	558
554	\N	\N	10	545
555	\N	\N	10	543
556	\N	\N	10	537
557	\N	\N	10	542
558	\N	\N	10	539
\.


--
-- Data for Name: cdr_module_dep; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_module_dep (pid, module_pid, prototype_pid, target_pid) FROM stdin;
1	3	3	2
2	4	4	2
3	6	8	5
4	7	12	2
5	7	9	5
6	8	16	2
7	8	17	7
8	9	19	2
9	10	21	5
10	10	22	2
\.


--
-- Data for Name: cdr_module_process; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_module_process (pid, first_mp, module_pid, nodeproc_pid, restart_required, module_status, module_status_desc, status_timestamp) FROM stdin;
1	t	1	1	f	2	\N	2022-03-17 00:14:32.211
2	t	2	1	f	2	\N	2022-03-17 00:14:32.522
3	t	3	1	f	2	\N	2022-03-17 00:14:35.01
4	t	4	1	f	2	\N	2022-03-17 00:14:36.227
5	t	5	1	f	2	\N	2022-03-17 00:15:06.513
6	t	6	1	f	2	\N	2022-03-17 00:15:07.555
7	t	7	1	f	2	\N	2022-03-17 00:15:09.399
8	t	8	1	f	2	\N	2022-03-17 00:15:09.858
9	t	9	1	f	2	\N	2022-03-17 00:15:11.801
10	t	10	1	f	2	\N	2022-03-17 00:15:12.119
\.


--
-- Data for Name: cdr_module_prot_cfg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_module_prot_cfg (pid, is_advanced, category_key, default_value, desc_key, enum_type, cfg_index, cfg_key, name_key, is_optional, cfg_type, prototype_pid) FROM stdin;
1	f	clustermgr_maintenance	15000	module_config.clustermgr.stats.heartbeat_persist_frequency_ms.desc	\N	0	stats.heartbeat_persist_frequency_ms	module_config.clustermgr.stats.heartbeat_persist_frequency_ms	t	POSITIVE_INTEGER	1
2	f	clustermgr_maintenance	60000	module_config.clustermgr.stats.stats_persist_frequency_ms.desc	\N	1	stats.stats_persist_frequency_ms	module_config.clustermgr.stats.stats_persist_frequency_ms	t	POSITIVE_INTEGER	1
3	f	clustermgr_maintenance	300000	module_config.clustermgr.stats.stats_cleanup_frequency_ms.desc	\N	2	stats.stats_cleanup_frequency_ms	module_config.clustermgr.stats.stats_cleanup_frequency_ms	t	POSITIVE_INTEGER	1
4	f	clustermgr_maintenance	4	module_config.clustermgr.schedule.thread_count.desc	\N	3	schedule.thread_count	module_config.clustermgr.schedule.thread_count	t	POSITIVE_INTEGER	1
5	f	clustermgr_maintenance	true	module_config.clustermgr.scheduled_jobs.persist_runtime_monitoring_statistics.enabled.desc	\N	4	scheduled_jobs.persist_runtime_monitoring_statistics.enabled	module_config.clustermgr.scheduled_jobs.persist_runtime_monitoring_statistics.enabled	t	BOOLEAN	1
6	f	clustermgr_message_broker	EMBEDDED_ACTIVEMQ	module_config.clustermgr.messagebroker.type.desc	ca.cdr.broker.ClusterManagerMessageBrokerTypeEnum	5	messagebroker.type	module_config.clustermgr.messagebroker.type	f	ENUM	1
7	f	clustermgr_message_broker	\N	module_config.clustermgr.messagebroker.username.desc	\N	6	messagebroker.username	module_config.clustermgr.messagebroker.username	t	STRING	1
8	f	clustermgr_message_broker	\N	module_config.clustermgr.messagebroker.password.desc	\N	7	messagebroker.password	module_config.clustermgr.messagebroker.password	t	PASSWORD	1
9	f	clustermgr_message_broker	\N	module_config.clustermgr.messagebroker.address.desc	\N	8	messagebroker.address	module_config.clustermgr.messagebroker.address	t	STRING	1
10	f	clustermgr_message_broker	\N	module_config.clustermgr.messagebroker.channel_naming.prefix.desc	\N	9	messagebroker.channel_naming.prefix	module_config.clustermgr.messagebroker.channel_naming.prefix	t	STRING	1
11	f	clustermgr_maintenance	true	module_config.clustermgr.audit_log.db.enabled.desc	\N	10	audit_log.db.enabled	module_config.clustermgr.audit_log.db.enabled	t	BOOLEAN	1
12	f	clustermgr_maintenance	false	module_config.clustermgr.audit_log.broker.enabled.desc	\N	11	audit_log.broker.enabled	module_config.clustermgr.audit_log.broker.enabled	t	BOOLEAN	1
13	f	clustermgr_maintenance	\N	module_config.clustermgr.audit_log.request_headers_to_store.desc	\N	12	audit_log.request_headers_to_store	module_config.clustermgr.audit_log.request_headers_to_store	t	STRING	1
14	f	clustermgr_maintenance	false	module_config.clustermgr.audit_log.db.async_writes.enabled.desc	\N	13	audit_log.db.async_writes.enabled	module_config.clustermgr.audit_log.db.async_writes.enabled	t	BOOLEAN	1
15	f	clustermgr_kafka	localhost:9092	module_config.kafka.bootstrap_address.desc	\N	14	kafka.bootstrap_address	module_config.kafka.bootstrap_address	t	STRING	1
16	f	clustermgr_kafka	smilecdr	module_config.kafka.group_id.desc	\N	15	kafka.group_id	module_config.kafka.group_id	t	STRING	1
17	f	clustermgr_kafka	false	module_config.kafka.validate_topics_exist_before_use.desc	\N	16	kafka.validate_topics_exist_before_use	module_config.kafka.validate_topics_exist_before_use	t	BOOLEAN	1
18	f	clustermgr_kafka	false	module_config.kafka.auto_commit.desc	\N	17	kafka.auto_commit	module_config.kafka.auto_commit	t	BOOLEAN	1
19	f	clustermgr_kafka	MANUAL	module_config.kafka.ack_mode.desc	org.springframework.kafka.listener.ContainerProperties$AckMode	18	kafka.ack_mode	module_config.kafka.ack_mode	t	ENUM	1
20	f	clustermgr_kafka	false	module_config.kafka.ssl.enabled.desc	\N	19	kafka.ssl.enabled	module_config.kafka.ssl.enabled	t	BOOLEAN	1
21	f	clustermgr_kafka	keystore/server.truststore.jks	module_config.kafka.ssl.truststore.location.desc	\N	20	kafka.ssl.truststore.location	module_config.kafka.ssl.truststore.location	t	STRING	1
22	f	clustermgr_kafka	\N	module_config.kafka.ssl.truststore.password.desc	\N	21	kafka.ssl.truststore.password	module_config.kafka.ssl.truststore.password	t	PASSWORD	1
23	f	clustermgr_kafka	keystore/server.keystore.jks	module_config.kafka.ssl.keystore.location.desc	\N	22	kafka.ssl.keystore.location	module_config.kafka.ssl.keystore.location	t	STRING	1
24	f	clustermgr_kafka	\N	module_config.kafka.ssl.keystore.password.desc	\N	23	kafka.ssl.keystore.password	module_config.kafka.ssl.keystore.password	t	PASSWORD	1
25	f	clustermgr_kafka	\N	module_config.kafka.ssl.key.password.desc	\N	24	kafka.ssl.key.password	module_config.kafka.ssl.key.password	t	STRING	1
26	f	clustermgr_kafka	PLAINTEXT	module_config.kafka.security.protocol.desc	org.apache.kafka.common.security.auth.SecurityProtocol	25	kafka.security.protocol	module_config.kafka.security.protocol	t	ENUM	1
27	f	clustermgr_kafka	\N	module_config.kafka.sasl.mechanism.desc	\N	26	kafka.sasl.mechanism	module_config.kafka.sasl.mechanism	t	STRING	1
28	f	clustermgr_kafka	\N	module_config.kafka.sasl.jaas.config.desc	\N	27	kafka.sasl.jaas.config	module_config.kafka.sasl.jaas.config	t	STRING	1
29	f	clustermgr_kafka	\N	module_config.kafka.producer.properties.text.desc	\N	28	kafka.producer.properties.text	module_config.kafka.producer.properties.text	t	PROPERTIES	1
30	f	clustermgr_kafka	\N	module_config.kafka.producer.properties.file.desc	\N	29	kafka.producer.properties.file	module_config.kafka.producer.properties.file	t	LOCAL_FILEPATH	1
31	f	clustermgr_kafka	\N	module_config.kafka.consumer.properties.text.desc	\N	30	kafka.consumer.properties.text	module_config.kafka.consumer.properties.text	t	PROPERTIES	1
32	f	clustermgr_kafka	\N	module_config.kafka.consumer.properties.file.desc	\N	31	kafka.consumer.properties.file	module_config.kafka.consumer.properties.file	t	LOCAL_FILEPATH	1
33	f	database	\N	module_config.persistence.db_driver.desc	ca.cdr.api.model.enm.DriverTypeEnum	32	db.driver	module_config.persistence.db_driver	f	ENUM	1
34	f	database	\N	module_config.persistence.db_url.desc	\N	33	db.url	module_config.persistence.db_url	f	STRING	1
35	f	database	\N	module_config.persistence.db_username.desc	\N	34	db.username	module_config.persistence.db_username	f	STRING	1
36	f	database	\N	module_config.persistence.db_password.desc	\N	35	db.password	module_config.persistence.db_password	f	PASSWORD	1
37	f	database	NONE	module_config.persistence.db_secrets_manager.desc	ca.cdr.api.database.DBSecretsManager	36	db.secrets_manager	module_config.persistence.db_secrets_manager	f	ENUM	1
38	f	database	UPDATE	module_config.persistence.db_schema_update_mode.desc	ca.cdr.api.model.enm.SchemaUpdateModeEnum	37	db.schema_update_mode	module_config.persistence.db_schema_update_mode	f	ENUM	1
39	f	database	false	module_config.persistence.db.expect_writable.desc	\N	38	db.expect_writable	module_config.persistence.db.expect_writable	f	BOOLEAN	1
40	f	database	0	module_config.persistence.db.connectionpool.minidle.desc	\N	39	db.connectionpool.minidle	module_config.persistence.db.connectionpool.minidle	f	NON_NEGATIVE_INTEGER	1
41	f	database	8	module_config.persistence.db.connectionpool.maxidle.desc	\N	40	db.connectionpool.maxidle	module_config.persistence.db.connectionpool.maxidle	f	NON_NEGATIVE_INTEGER	1
42	f	database	8	module_config.persistence.db.connectionpool.maxtotal.desc	\N	41	db.connectionpool.maxtotal	module_config.persistence.db.connectionpool.maxtotal	f	POSITIVE_INTEGER	1
43	f	database	\N	module_config.persistence.db.connectionpool.maxlifetime.millis.desc	\N	42	db.connectionpool.maxlifetime.millis	module_config.persistence.db.connectionpool.maxlifetime.millis	t	POSITIVE_INTEGER	1
44	f	database	30	module_config.persistence.db.connectionpool.maxwait_seconds.desc	\N	43	db.connectionpool.maxwait_seconds	module_config.persistence.db.connectionpool.maxwait_seconds	f	POSITIVE_INTEGER	1
45	f	database	60	module_config.persistence.db.connectionpool.default_query_timeout_seconds.desc	\N	44	db.connectionpool.default_query_timeout_seconds	module_config.persistence.db.connectionpool.default_query_timeout_seconds	f	NON_NEGATIVE_INTEGER	1
46	f	database	false	module_config.persistence.db.connectionpool.pool_prepared_statements.desc	\N	45	db.connectionpool.pool_prepared_statements	module_config.persistence.db.connectionpool.pool_prepared_statements	f	BOOLEAN	1
47	f	database	true	module_config.persistence.db.connectionpool.test_on_return.desc	\N	46	db.connectionpool.test_on_return	module_config.persistence.db.connectionpool.test_on_return	f	BOOLEAN	1
48	f	database	false	module_config.persistence.db.connectionpool.log_abandoned.desc	\N	47	db.connectionpool.log_abandoned	module_config.persistence.db.connectionpool.log_abandoned	f	BOOLEAN	1
49	f	database	false	module_config.persistence.db.connectionpool.remove_abandoned_on_borrow.desc	\N	48	db.connectionpool.remove_abandoned_on_borrow	module_config.persistence.db.connectionpool.remove_abandoned_on_borrow	f	BOOLEAN	1
50	f	database	300	module_config.persistence.db.connectionpool.remove_abandoned_timeout_seconds.desc	\N	49	db.connectionpool.remove_abandoned_timeout_seconds	module_config.persistence.db.connectionpool.remove_abandoned_timeout_seconds	f	NON_NEGATIVE_INTEGER	1
51	f	transactionlog	false	module_config.clustermgr.transactionlog.broker.enabled.desc	\N	50	transactionlog.broker.enabled	module_config.clustermgr.transactionlog.broker.enabled	t	BOOLEAN	1
52	f	transactionlog	true	module_config.clustermgr.transactionlog.enabled.desc	\N	51	transactionlog.enabled	module_config.clustermgr.transactionlog.enabled	t	BOOLEAN	1
53	f	transactionlog	true	module_config.clustermgr.transactionlog.persist_bodies_in_clustermgr_db.desc	\N	52	transactionlog.persist_bodies_in_clustermgr_db	module_config.clustermgr.transactionlog.persist_bodies_in_clustermgr_db	t	BOOLEAN	1
54	f	transactionlog	true	module_config.clustermgr.transactionlog.persist_endpoint_receive_bodies.desc	\N	53	transactionlog.persist_endpoint_receive_bodies	module_config.clustermgr.transactionlog.persist_endpoint_receive_bodies	t	BOOLEAN	1
55	f	transactionlog	true	module_config.clustermgr.transactionlog.persist_endpoint_reply_bodies.desc	\N	54	transactionlog.persist_endpoint_reply_bodies	module_config.clustermgr.transactionlog.persist_endpoint_reply_bodies	t	BOOLEAN	1
56	f	transactionlog	10000	module_config.clustermgr.transactionlog.truncate_body.bytes.desc	\N	55	transactionlog.truncate_body.bytes	module_config.clustermgr.transactionlog.truncate_body.bytes	t	NON_NEGATIVE_INTEGER	1
57	f	transactionlog	\N	module_config.clustermgr.transactionlog.event_whitelist.desc	\N	56	transactionlog.event_whitelist	module_config.clustermgr.transactionlog.event_whitelist	t	STRING	1
58	f	transactionlog	\N	module_config.clustermgr.transactionlog.event_blacklist.desc	\N	57	transactionlog.event_blacklist	module_config.clustermgr.transactionlog.event_blacklist	t	STRING	1
59	f	clustermgr_maintenance	90	module_config.clustermgr_maintenance.retain_transaction_log_days.desc	\N	58	retain_transaction_log_days	module_config.clustermgr_maintenance.retain_transaction_log_days	t	NON_NEGATIVE_INTEGER	1
60	f	clustermgr_maintenance	7	module_config.clustermgr_maintenance.retain_minute_stats_days.desc	\N	59	retain_minute_stats_days	module_config.clustermgr_maintenance.retain_minute_stats_days	t	NON_NEGATIVE_INTEGER	1
61	f	clustermgr_maintenance	31	module_config.clustermgr_maintenance.retain_hour_stats_days.desc	\N	60	retain_hour_stats_days	module_config.clustermgr_maintenance.retain_hour_stats_days	t	NON_NEGATIVE_INTEGER	1
62	f	clustermgr_maintenance	365	module_config.clustermgr_maintenance.retain_day_stats_days.desc	\N	61	retain_day_stats_days	module_config.clustermgr_maintenance.retain_day_stats_days	t	NON_NEGATIVE_INTEGER	1
63	f	email_server	localhost	module_config.email_server.smtp.hostname.desc	\N	62	smtp.hostname	module_config.email_server.smtp.hostname	t	STRING	1
64	f	email_server	25	module_config.email_server.smtp.port.desc	\N	63	smtp.port	module_config.email_server.smtp.port	t	POSITIVE_INTEGER	1
65	f	email_server	\N	module_config.email_server.smtp.username.desc	\N	64	smtp.username	module_config.email_server.smtp.username	t	STRING	1
66	f	email_server	\N	module_config.email_server.smtp.password.desc	\N	65	smtp.password	module_config.email_server.smtp.password	t	PASSWORD	1
67	f	email_server	false	module_config.email_server.smtp.use_starttls.desc	\N	66	smtp.use_starttls	module_config.email_server.smtp.use_starttls	t	BOOLEAN	1
68	f	credentials	BCRYPT_12_ROUND	module_config.security_in_local.password_encoding_type.desc	ca.cdr.api.model.enm.PasswordEncodingTypeEnum	0	password_encoding_type	module_config.security_in_local.password_encoding_type	f	ENUM	2
69	f	credentials	true	module_config.security_in_local.cache_successful_credentials.desc	\N	1	cache_successful_credentials	module_config.security_in_local.cache_successful_credentials	f	BOOLEAN	2
70	t	initial_user_seeding	\N	module_config.security_in_local.seed.users.file.desc	\N	2	seed.users.file	module_config.security_in_local.seed.users.file	f	LOCAL_FILEPATH	2
71	f	credentials	false	module_config.security_in_local.username_case_sensitive.desc	\N	3	username_case_sensitive	module_config.security_in_local.username_case_sensitive	f	BOOLEAN	2
72	f	credentials	true	module_config.security_in_local.password_case_sensitive.desc	\N	4	password_case_sensitive	module_config.security_in_local.password_case_sensitive	f	BOOLEAN	2
73	f	credentials	false	module_config.security_in_local.create_unknown_users.desc	\N	5	create_unknown_users	module_config.security_in_local.create_unknown_users	f	BOOLEAN	2
74	f	credentials	.{4,100}	module_config.security_in_local.password_pattern.desc	\N	6	password_pattern	module_config.security_in_local.password_pattern	f	STRING	2
75	f	credentials	Invalid password	module_config.security_in_local.password_pattern_mismatch_error.desc	\N	7	password_mismatch_pattern_error	module_config.security_in_local.password_pattern_mismatch_error	f	STRING	2
76	f	auth_callback_scripts	\N	module_config.security_in_local.callback_script.text.desc	\N	8	callback_script.text	module_config.security_in_local.callback_script.text	t	JAVASCRIPT	2
77	f	auth_callback_scripts	\N	module_config.security_in_local.callback_script.file.desc	\N	9	callback_script.file	module_config.security_in_local.callback_script.file	t	LOCAL_FILEPATH	2
78	f	tfa_security_settings	Smile CDR	module_config.security_in_local.tfa.totp.issuer_name.desc	\N	10	tfa.totp.issuer_name	module_config.security_in_local.tfa.totp.issuer_name	t	STRING	2
79	f	tfa_security_settings	10	module_config.security_in_local.tfa.totp.lock_after_failed_attempts.desc	\N	11	tfa.totp.lock_after_failed_attempts	module_config.security_in_local.tfa.totp.lock_after_failed_attempts	t	STRING	2
80	f	credentials	5	module_config.security_in_local.lock_after_failed_attempts.desc	\N	12	max_failed_logins_until_lock	module_config.security_in_local.lock_after_failed_attempts	f	NON_NEGATIVE_INTEGER	2
81	f	user_self_registration	false	module_config.security_in_local.user_self_registration.enabled.desc	\N	13	user_self_registration.enabled	module_config.security_in_local.user_self_registration.enabled	f	BOOLEAN	2
82	f	user_self_registration	\N	module_config.security_in_local.user_self_registration.referer_url_list.text.desc	\N	14	user_self_registration.referer_url_list.text	module_config.security_in_local.user_self_registration.referer_url_list.text	t	STRING	2
83	f	user_self_registration	\N	module_config.security_in_local.user_self_registration.create_script.text.desc	\N	15	user_self_registration.create_script.text	module_config.security_in_local.user_self_registration.create_script.text	t	JAVASCRIPT	2
84	f	user_self_registration	\N	module_config.security_in_local.user_self_registration.create_script.file.desc	\N	16	user_self_registration.create_script.file	module_config.security_in_local.user_self_registration.create_script.file	t	LOCAL_FILEPATH	2
85	f	http_listener	\N	module_config.base_jetty_server.port.desc	\N	0	port	module_config.base_jetty_server.port	f	POSITIVE_INTEGER	3
86	f	http_listener	0.0.0.0	module_config.base_jetty_server.bind_address.desc	\N	1	bind_address	module_config.base_jetty_server.bind_address	f	STRING	3
87	f	http_listener	/	module_config.base_jetty_server.context_path.desc	\N	2	context_path	module_config.base_jetty_server.context_path	t	STRING	3
88	f	http_listener	/endpoint-health	module_config.base_jetty_server.endpoint_health.path.desc	\N	3	endpoint_health.path	module_config.base_jetty_server.endpoint_health.path	t	STRING	3
89	f	http_listener	false	module_config.base_jetty_server.respect_forward_headers.desc	\N	4	respect_forward_headers	module_config.base_jetty_server.respect_forward_headers	f	BOOLEAN	3
90	f	http_listener	false	module_config.base_jetty_server.https_forwarding_assumed.desc	\N	5	https_forwarding_assumed	module_config.base_jetty_server.https_forwarding_assumed	f	BOOLEAN	3
91	f	http_security	\N	module_config.base_jetty_server.pin_host.desc	\N	6	pin_host	module_config.base_jetty_server.pin_host	t	STRING	3
92	f	http_security	false	module_config.base_jetty_server.suppress_platform_info	\N	7	suppress_platform_info	module_config.base_jetty_server.suppress_platform_info	t	BOOLEAN	3
93	f	http_security	false	module_config.base_jetty_server.suppress_error_details.desc	\N	8	suppress_error_details	module_config.base_jetty_server.suppress_error_details	t	BOOLEAN	3
94	f	http_security	false	module_config.base_jetty_server.block_http_head.desc	\N	9	block_http_head	module_config.base_jetty_server.block_http_head	t	BOOLEAN	3
95	f	http_security	false	module_config.base_jetty_server.block_http_options.desc	\N	10	block_http_options	module_config.base_jetty_server.block_http_options	t	BOOLEAN	3
96	f	http_security	\N	module_config.base_jetty_server.custom_response_headers.desc	\N	11	custom_response_headers	module_config.base_jetty_server.custom_response_headers	t	STRING_MULTILINE	3
97	f	http_request_pool	5	module_config.base_jetty_server.threadpool_min.desc	\N	12	threadpool.min	module_config.base_jetty_server.threadpool_min	f	NON_NEGATIVE_INTEGER	3
98	f	http_request_pool	10	module_config.base_jetty_server.threadpool_max.desc	\N	13	threadpool.max	module_config.base_jetty_server.threadpool_max	f	POSITIVE_INTEGER	3
99	f	http_request_pool	\N	module_config.base_jetty_server.threadpool.accept_queue_size.desc	\N	14	threadpool.accept_queue_size	module_config.base_jetty_server.threadpool.accept_queue_size	f	NON_NEGATIVE_INTEGER	3
100	f	http_request_pool	8	module_config.base_jetty_server.max_header_size.request.kb.desc	\N	15	max_header_size.request.kb	module_config.base_jetty_server.max_header_size.request.kb	f	POSITIVE_INTEGER	3
101	f	http_request_pool	8	module_config.base_jetty_server.max_header_size.response.kb.desc	\N	16	max_header_size.response.kb	module_config.base_jetty_server.max_header_size.response.kb	f	POSITIVE_INTEGER	3
102	f	http_request_pool	30000	module_config.base_jetty_server.read_idle_timeout.millis.desc	\N	17	read_idle_timeout.millis	module_config.base_jetty_server.read_idle_timeout.millis	f	POSITIVE_INTEGER	3
103	f	sessions	false	module_config.base_jetty_server.use_inmemory_sessions.desc	\N	18	sessions.inmemory	module_config.base_jetty_server.use_inmemory_sessions	f	BOOLEAN	3
104	f	sessions	30	module_config.base_jetty_server.session_timeout_mins.desc	\N	19	sessions.timeout.mins	module_config.base_jetty_server.session_timeout_mins	f	POSITIVE_INTEGER	3
105	f	sessions	60000	module_config.base_jetty_server.session_scavenger_interval_millis.desc	\N	20	sessions.scavenger.interval.millis	module_config.base_jetty_server.session_scavenger_interval_millis	f	POSITIVE_INTEGER	3
106	f	http_access_log	\N	module_config.base_jetty_server.access_log.appenders.desc	\N	21	access_log.appenders	module_config.base_jetty_server.access_log.appenders	f	STRING_MULTILINE	3
107	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_file.desc	\N	22	tls.keystore.file	module_config.base_server.tls_keystore_file	t	LOCAL_FILEPATH	3
108	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_password.desc	\N	23	tls.keystore.password	module_config.base_server.tls_keystore_password	t	PASSWORD	3
109	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_keyalias.desc	\N	24	tls.keystore.keyalias	module_config.base_server.tls_keystore_keyalias	t	STRING	3
110	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_keypass.desc	\N	25	tls.keystore.keypass	module_config.base_server.tls_keystore_keypass	t	PASSWORD	3
111	f	tls_ssl_encryption	false	module_config.base_server.tls_enabled.desc	\N	26	tls.enabled	module_config.base_server.tls_enabled	f	BOOLEAN	3
112	f	tls_ssl_encryption	false	module_config.base_server.tls_clientauth_enabled.desc	\N	27	tls.clientauth.enabled	module_config.base_server.tls_clientauth_enabled	f	BOOLEAN	3
113	f	tls_ssl_encryption	\N	module_config.base_server.tls_truststore_file.desc	\N	28	tls.truststore.file	module_config.base_server.tls_truststore_file	t	LOCAL_FILEPATH	3
114	f	tls_ssl_encryption	\N	module_config.base_server.tls_truststore_password.desc	\N	29	tls.truststore.password	module_config.base_server.tls_truststore_password	t	PASSWORD	3
115	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.cipher_whitelist.desc	\N	30	tls.protocol.cipher_whitelist	module_config.base_server.tls.protocol.cipher_whitelist	t	STRING	3
116	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.cipher_blacklist.desc	\N	31	tls.protocol.cipher_blacklist	module_config.base_server.tls.protocol.cipher_blacklist	t	STRING	3
117	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.protocol_whitelist.desc	\N	32	tls.protocol.protocol_whitelist	module_config.base_server.tls.protocol.protocol_whitelist	t	STRING	3
118	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.protocol_blacklist.desc	\N	33	tls.protocol.protocol_blacklist	module_config.base_server.tls.protocol.protocol_blacklist	t	STRING	3
119	f	admin_web_console_config	DEFAULT_HIDDEN	module_config.admin_web_console.transaction_log.payload_body_display_mode.desc	ca.cdr.api.model.enm.AdminWebConsoleTransactionLogBodyDisplayModeEnum	34	transaction_log.payload_body_display_mode	module_config.admin_web_console.transaction_log.payload_body_display_mode	t	ENUM	3
120	f	auth_general_for_web	false	module_config.base_jetty_server.saml.enabled.desc	\N	35	saml.enabled	module_config.base_jetty_server.saml.enabled	t	BOOLEAN	3
121	f	http_security	\N	module_config.base_jetty_server.frame_options.allow_from.desc	\N	36	frame_options.allow_from	module_config.base_jetty_server.frame_options.allow_from	t	STRING	3
122	f	http_listener	\N	module_config.base_jetty_server.port.desc	\N	0	port	module_config.base_jetty_server.port	f	POSITIVE_INTEGER	4
123	f	http_listener	0.0.0.0	module_config.base_jetty_server.bind_address.desc	\N	1	bind_address	module_config.base_jetty_server.bind_address	f	STRING	4
124	f	http_listener	/	module_config.base_jetty_server.context_path.desc	\N	2	context_path	module_config.base_jetty_server.context_path	t	STRING	4
125	f	http_listener	/endpoint-health	module_config.base_jetty_server.endpoint_health.path.desc	\N	3	endpoint_health.path	module_config.base_jetty_server.endpoint_health.path	t	STRING	4
126	f	http_listener	false	module_config.base_jetty_server.respect_forward_headers.desc	\N	4	respect_forward_headers	module_config.base_jetty_server.respect_forward_headers	f	BOOLEAN	4
127	f	http_listener	false	module_config.base_jetty_server.https_forwarding_assumed.desc	\N	5	https_forwarding_assumed	module_config.base_jetty_server.https_forwarding_assumed	f	BOOLEAN	4
128	f	http_security	\N	module_config.base_jetty_server.pin_host.desc	\N	6	pin_host	module_config.base_jetty_server.pin_host	t	STRING	4
129	f	http_security	false	module_config.base_jetty_server.suppress_platform_info	\N	7	suppress_platform_info	module_config.base_jetty_server.suppress_platform_info	t	BOOLEAN	4
130	f	http_security	false	module_config.base_jetty_server.suppress_error_details.desc	\N	8	suppress_error_details	module_config.base_jetty_server.suppress_error_details	t	BOOLEAN	4
131	f	http_security	false	module_config.base_jetty_server.block_http_head.desc	\N	9	block_http_head	module_config.base_jetty_server.block_http_head	t	BOOLEAN	4
132	f	http_security	false	module_config.base_jetty_server.block_http_options.desc	\N	10	block_http_options	module_config.base_jetty_server.block_http_options	t	BOOLEAN	4
133	f	http_security	\N	module_config.base_jetty_server.custom_response_headers.desc	\N	11	custom_response_headers	module_config.base_jetty_server.custom_response_headers	t	STRING_MULTILINE	4
134	f	http_request_pool	5	module_config.base_jetty_server.threadpool_min.desc	\N	12	threadpool.min	module_config.base_jetty_server.threadpool_min	f	NON_NEGATIVE_INTEGER	4
135	f	http_request_pool	10	module_config.base_jetty_server.threadpool_max.desc	\N	13	threadpool.max	module_config.base_jetty_server.threadpool_max	f	POSITIVE_INTEGER	4
136	f	http_request_pool	\N	module_config.base_jetty_server.threadpool.accept_queue_size.desc	\N	14	threadpool.accept_queue_size	module_config.base_jetty_server.threadpool.accept_queue_size	f	NON_NEGATIVE_INTEGER	4
137	f	http_request_pool	8	module_config.base_jetty_server.max_header_size.request.kb.desc	\N	15	max_header_size.request.kb	module_config.base_jetty_server.max_header_size.request.kb	f	POSITIVE_INTEGER	4
138	f	http_request_pool	8	module_config.base_jetty_server.max_header_size.response.kb.desc	\N	16	max_header_size.response.kb	module_config.base_jetty_server.max_header_size.response.kb	f	POSITIVE_INTEGER	4
139	f	http_request_pool	30000	module_config.base_jetty_server.read_idle_timeout.millis.desc	\N	17	read_idle_timeout.millis	module_config.base_jetty_server.read_idle_timeout.millis	f	POSITIVE_INTEGER	4
140	f	sessions	false	module_config.base_jetty_server.use_inmemory_sessions.desc	\N	18	sessions.inmemory	module_config.base_jetty_server.use_inmemory_sessions	f	BOOLEAN	4
141	f	sessions	30	module_config.base_jetty_server.session_timeout_mins.desc	\N	19	sessions.timeout.mins	module_config.base_jetty_server.session_timeout_mins	f	POSITIVE_INTEGER	4
142	f	sessions	60000	module_config.base_jetty_server.session_scavenger_interval_millis.desc	\N	20	sessions.scavenger.interval.millis	module_config.base_jetty_server.session_scavenger_interval_millis	f	POSITIVE_INTEGER	4
143	f	http_access_log	\N	module_config.base_jetty_server.access_log.appenders.desc	\N	21	access_log.appenders	module_config.base_jetty_server.access_log.appenders	f	STRING_MULTILINE	4
144	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_file.desc	\N	22	tls.keystore.file	module_config.base_server.tls_keystore_file	t	LOCAL_FILEPATH	4
145	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_password.desc	\N	23	tls.keystore.password	module_config.base_server.tls_keystore_password	t	PASSWORD	4
146	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_keyalias.desc	\N	24	tls.keystore.keyalias	module_config.base_server.tls_keystore_keyalias	t	STRING	4
147	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_keypass.desc	\N	25	tls.keystore.keypass	module_config.base_server.tls_keystore_keypass	t	PASSWORD	4
148	f	tls_ssl_encryption	false	module_config.base_server.tls_enabled.desc	\N	26	tls.enabled	module_config.base_server.tls_enabled	f	BOOLEAN	4
149	f	tls_ssl_encryption	false	module_config.base_server.tls_clientauth_enabled.desc	\N	27	tls.clientauth.enabled	module_config.base_server.tls_clientauth_enabled	f	BOOLEAN	4
150	f	tls_ssl_encryption	\N	module_config.base_server.tls_truststore_file.desc	\N	28	tls.truststore.file	module_config.base_server.tls_truststore_file	t	LOCAL_FILEPATH	4
151	f	tls_ssl_encryption	\N	module_config.base_server.tls_truststore_password.desc	\N	29	tls.truststore.password	module_config.base_server.tls_truststore_password	t	PASSWORD	4
152	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.cipher_whitelist.desc	\N	30	tls.protocol.cipher_whitelist	module_config.base_server.tls.protocol.cipher_whitelist	t	STRING	4
153	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.cipher_blacklist.desc	\N	31	tls.protocol.cipher_blacklist	module_config.base_server.tls.protocol.cipher_blacklist	t	STRING	4
154	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.protocol_whitelist.desc	\N	32	tls.protocol.protocol_whitelist	module_config.base_server.tls.protocol.protocol_whitelist	t	STRING	4
155	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.protocol_blacklist.desc	\N	33	tls.protocol.protocol_blacklist	module_config.base_server.tls.protocol.protocol_blacklist	t	STRING	4
156	f	auth_general_for_apis	false	module_config.base_jetty_server.anonymous_access_enabled.desc	\N	34	anonymous.access.enabled	module_config.base_jetty_server.anonymous_access_enabled	f	BOOLEAN	4
157	f	auth_general_for_apis	ANONYMOUS	module_config.base_jetty_server.anonymous.access.account_username.desc	\N	35	anonymous.access.account_username	module_config.base_jetty_server.anonymous.access.account_username	f	STRING	4
158	f	auth_http_basic	false	module_config.base_jetty_server.security.http_basic.enabled.desc	\N	36	security.http.basic.enabled	module_config.base_jetty_server.security.http_basic.enabled	f	BOOLEAN	4
159	f	auth_http_basic	Smile CDR	module_config.base_jetty_server.security.http_basic.realm.desc	\N	37	security.http.basic.realm	module_config.base_jetty_server.security.http_basic.realm	f	STRING	4
160	f	auth_openid_connect	false	module_config.base_jetty_server.security.oic.enabled.desc	\N	38	security.oic.enabled	module_config.base_jetty_server.security.oic.enabled	f	BOOLEAN	4
161	f	trusted_client	false	module_config.base_jetty_server.trusted_client.enabled.desc	\N	39	trusted_client.enabled	module_config.base_jetty_server.trusted_client.enabled	f	BOOLEAN	4
162	f	trusted_client	false	module_config.base_jetty_server.trusted_client.assert_permissions.desc	\N	40	trusted_client.assert_permissions	module_config.base_jetty_server.trusted_client.assert_permissions	f	BOOLEAN	4
163	f	cross_origin_resource_sharing_cors	false	module_config.base_jetty_server.cors_enable.desc	\N	41	cors.enable	module_config.base_jetty_server.cors_enable	f	BOOLEAN	4
164	f	cross_origin_resource_sharing_cors	*	module_config.base_jetty_server.cors_origins.desc	\N	42	cors.origins	module_config.base_jetty_server.cors_origins	f	STRING	4
165	f	cross_origin_resource_sharing_cors	\N	module_config.base_jetty_server.cors_allowed_headers.desc	\N	43	cors.allowed_headers	module_config.base_jetty_server.cors_allowed_headers	f	STRING	4
166	f	http_security	\N	module_config.base_jetty_server.frame_options.allow_from.desc	\N	44	frame_options.allow_from	module_config.base_jetty_server.frame_options.allow_from	t	STRING	4
167	f	fhir_configuration	false	module_config.persistence.cascading_delete.enabled.desc	\N	0	cascading_delete.enabled	module_config.persistence.cascading_delete.enabled	f	BOOLEAN	5
168	f	fhir_configuration	false	module_config.persistence.seed.base_validation_resources.desc	\N	1	seed.base_validation_resources	module_config.persistence.seed.base_validation_resources	f	BOOLEAN	5
169	f	fhir_configuration	false	module_config.persistence.read_only_mode.enabled.desc	\N	2	read_only_mode.enabled	module_config.persistence.read_only_mode.enabled	t	BOOLEAN	5
170	f	fhir_livebundle_service	false	module_config.persistence.livebundle_service.enabled.desc	\N	3	livebundle_service.enabled	module_config.persistence.livebundle_service.enabled	f	BOOLEAN	5
171	f	fhir_livebundle_service	true	module_config.persistence.livebundle_service.watchlist_cache.enabled.desc	\N	4	livebundle_service.watchlist_cache.enabled	module_config.persistence.livebundle_service.watchlist_cache.enabled	f	BOOLEAN	5
172	f	fhir_livebundle_service	2	module_config.persistence.livebundle_service.threadcount.desc	\N	5	livebundle_service.threadcount	module_config.persistence.livebundle_service.threadcount	f	POSITIVE_INTEGER	5
237	f	database	8	module_config.persistence.db.connectionpool.maxidle.desc	\N	70	db.connectionpool.maxidle	module_config.persistence.db.connectionpool.maxidle	f	NON_NEGATIVE_INTEGER	5
173	f	fhir_livebundle_service	\N	module_config.persistence.livebundle_service.script.text.desc	\N	6	livebundle_service.script.text	module_config.persistence.livebundle_service.script.text	t	JAVASCRIPT	5
174	f	fhir_livebundle_service	\N	module_config.persistence.livebundle_service.script.file.desc	\N	7	livebundle_service.script.file	module_config.persistence.livebundle_service.script.file	t	LOCAL_FILEPATH	5
175	f	fhir_resource_types	\N	module_config.persistence.resource_types.supported.whitelist.desc	\N	8	resource_types.supported.whitelist	module_config.persistence.resource_types.supported.whitelist	t	STRING	5
176	f	lucene_fulltext_indexing	false	module_config.persistence.lucene.enabled.desc	\N	9	lucene.enabled	module_config.persistence.lucene.enabled	f	BOOLEAN	5
177	t	lucene_fulltext_indexing	LUCENE_DISK	module_config.persistence.db.hibernate_search.mode.desc	ca.cdr.api.model.enm.HibernateSearchModeEnum	10	db.hibernate_search.mode	module_config.persistence.db.hibernate_search.mode	f	ENUM	5
178	f	lucene_fulltext_indexing	true	module_config.persistence.db.hibernate_search.index.terminology.desc	\N	11	db.hibernate_search.index.terminology	module_config.persistence.db.hibernate_search.index.terminology	f	BOOLEAN	5
179	f	lucene_fulltext_indexing	false	module_config.persistence.db.hibernate_search.index.fulltext_content.desc	\N	12	db.hibernate_search.index.fulltext_content	module_config.persistence.db.hibernate_search.index.fulltext_content	f	BOOLEAN	5
180	f	lucene_fulltext_indexing	\N	module_config.persistence.hibernate_search_directory.desc	\N	13	db.hibernate_search.directory	module_config.persistence.hibernate_search_directory	t	LOCAL_FILEDIR	5
181	f	lucene_fulltext_indexing	http://localhost:9090	module_config.persistence.db.hibernate_search.elasticsearch.url.desc	\N	14	db.hibernate_search.elasticsearch.url	module_config.persistence.db.hibernate_search.elasticsearch.url	f	STRING	5
182	f	lucene_fulltext_indexing	http	module_config.persistence.db.hibernate_search.elasticsearch.protocol.desc	\N	15	db.hibernate_search.elasticsearch.protocol	module_config.persistence.db.hibernate_search.elasticsearch.protocol	f	STRING	5
183	f	lucene_fulltext_indexing	\N	module_config.persistence.db.hibernate_search.elasticsearch.username.desc	\N	16	db.hibernate_search.elasticsearch.username	module_config.persistence.db.hibernate_search.elasticsearch.username	f	STRING	5
184	f	lucene_fulltext_indexing	\N	module_config.persistence.db.hibernate_search.elasticsearch.password.desc	\N	17	db.hibernate_search.elasticsearch.password	module_config.persistence.db.hibernate_search.elasticsearch.password	f	PASSWORD	5
185	f	fhir_search	50	module_config.persistence.page_size.default.desc	\N	18	page_size.default	module_config.persistence.page_size.default	f	POSITIVE_INTEGER	5
186	f	fhir_search	250	module_config.persistence.page_size.maximum.desc	\N	19	page_size.maximum	module_config.persistence.page_size.maximum	f	POSITIVE_INTEGER	5
187	f	fhir_search	DATABASE	module_config.persistence.searchcache.type.desc	ca.cdr.pers.module.SearchCacheTypeEnum	20	searchcache.type	module_config.persistence.searchcache.type	f	ENUM	5
188	f	fhir_search	\N	module_config.persistence.searchcache.infinispan.servers.desc	\N	21	searchcache.infinispan.servers	module_config.persistence.searchcache.infinispan.servers	f	STRING	5
189	f	fhir_search	\N	module_config.persistence.searchcache.infinispan.cache.name.desc	\N	22	searchcache.infinispan.cache.name	module_config.persistence.searchcache.infinispan.cache.name	f	STRING	5
190	f	fhir_search	PROTOCOL_VERSION_23	module_config.persistence.searchcache.infinispan.protocol_version.desc	ca.cdr.pers.infinispan.HotrodProtocolVersionEnum	23	searchcache.infinispan.protocol_version	module_config.persistence.searchcache.infinispan.protocol_version	f	ENUM	5
191	f	fhir_search	METAPHONE	module_config.persistence.search.phonetic_encoder.desc	ca.uhn.fhir.context.phonetic.PhoneticEncoderEnum	24	search.phonetic_encoder	module_config.persistence.search.phonetic_encoder	f	ENUM	5
192	f	fhir_search	false	module_config.persistence.always_use_offset_searches.desc	\N	25	always_use_offset_searches	module_config.persistence.always_use_offset_searches	f	BOOLEAN	5
193	f	fhir_interceptors	\N	module_config.persistence.interceptor_bean_types.desc	\N	26	interceptor_bean_types	module_config.persistence.interceptor_bean_types	f	STRING	5
194	f	fhir_performance	false	module_config.persistence.suppress_scheduled_maintenance_jobs.desc	\N	27	suppress_scheduled_maintenance_jobs	module_config.persistence.suppress_scheduled_maintenance_jobs	t	BOOLEAN	5
195	f	fhir_performance	false	module_config.persistence.write_semaphore_mode.enabled.desc	\N	28	write_semaphore_mode.enabled	module_config.persistence.write_semaphore_mode.enabled	t	BOOLEAN	5
196	f	fhir_performance	false	module_config.persistence.write_semaphore_mode.log_waits.desc	\N	29	write_semaphore_mode.log_waits	module_config.persistence.write_semaphore_mode.log_waits	t	BOOLEAN	5
197	f	fhir_mdm	false	module_config.persistence.mdm.enabled.desc	\N	30	mdm.enabled	module_config.persistence.mdm.enabled	f	BOOLEAN	5
198	f	fhir_realtime_export	false	module_config.persistence.realtime_export.pointcut.enabled.desc	\N	31	realtime_export.pointcut.enabled	module_config.persistence.realtime_export.pointcut.enabled	f	BOOLEAN	5
199	f	fhir_storage_partitioning	false	module_config.persistence.partitioning.enabled.desc	\N	32	partitioning.enabled	module_config.persistence.partitioning.enabled	f	BOOLEAN	5
200	f	fhir_storage_partitioning	true	module_config.persistence.partitioning_security.enabled.desc	\N	33	partitioning_security.enabled	module_config.persistence.partitioning_security.enabled	f	BOOLEAN	5
201	f	fhir_storage_partitioning	MANUAL	module_config.persistence.partitioning.partition_selection_mode.desc	ca.cdr.api.model.enm.PartitionSelectionModeEnum	34	partitioning.partition_selection_mode	module_config.persistence.partitioning.partition_selection_mode	t	ENUM	5
202	f	fhir_storage_partitioning	\N	module_config.persistence.partitioning.seed.file.desc	\N	35	partitioning.seed.file	module_config.persistence.partitioning.seed.file	t	LOCAL_FILEPATH	5
203	f	fhir_storage_partitioning	NOT_ALLOWED	module_config.persistence.partitioning.cross_partition_reference_mode.desc	ca.uhn.fhir.jpa.model.config.PartitionSettings$CrossPartitionReferenceMode	36	partitioning.cross_partition_reference_mode	module_config.persistence.partitioning.cross_partition_reference_mode	t	ENUM	5
204	f	fhir_storage_partitioning	\N	module_config.persistence.partitioning.default_partition_id.desc	\N	37	partitioning.default_partition_id	module_config.persistence.partitioning.default_partition_id	t	INTEGER	5
205	f	fhir_storage_partitioning	NAMED	module_config.persistence.partitioning.naming_mode.desc	ca.cdr.pers.module.PartitionNamingModeEnum	38	partitioning.naming_mode	module_config.persistence.partitioning.naming_mode	t	ENUM	5
206	f	fhir_binary_storage	true	module_config.persistence.binary_storage.access_operations.enabled.desc	\N	39	binary_storage.access_operations.enabled	module_config.persistence.binary_storage.access_operations.enabled	f	BOOLEAN	5
207	f	fhir_binary_storage	DATABASE	module_config.persistence.binary_storage.mode.desc	ca.cdr.api.model.enm.PersistenceBinaryStorageModeEnum	40	binary_storage.mode	module_config.persistence.binary_storage.mode	f	ENUM	5
208	f	fhir_binary_storage	10000	module_config.persistence.binary_storage.size.min.desc	\N	41	binary_storage.size.min	module_config.persistence.binary_storage.size.min	f	NON_NEGATIVE_INTEGER	5
209	f	fhir_binary_storage	104857600	module_config.persistence.binary_storage.size.max.desc	\N	42	binary_storage.size.max	module_config.persistence.binary_storage.size.max	f	POSITIVE_INTEGER	5
210	f	fhir_binary_storage	\N	module_config.persistence.binary_storage.filesystem.directory.desc	\N	43	binary_storage.filesystem.directory	module_config.persistence.binary_storage.filesystem.directory	t	LOCAL_FILEDIR	5
211	f	fhir_bulk_operations	false	module_config.persistence.bulk_export.enabled.desc	\N	44	bulk_export.enabled	module_config.persistence.bulk_export.enabled	f	BOOLEAN	5
212	f	fhir_bulk_operations	10	module_config.persistence.bulk_import.auto_retry.max_count.desc	\N	45	bulk_import.auto_retry.max_count	module_config.persistence.bulk_import.auto_retry.max_count	f	POSITIVE_INTEGER	5
213	f	capability_statement_metadata	true	module_config.metadata.resource_counts.enabled.desc	\N	46	metadata.resource_counts.enabled	module_config.metadata.resource_counts.enabled	f	BOOLEAN	5
214	f	capability_statement_metadata	240	module_config.metadata.resource_counts.cache.minutes.desc	\N	47	metadata.resource_counts.cache.minutes	module_config.metadata.resource_counts.cache.minutes	f	NON_NEGATIVE_INTEGER	5
215	f	fhir_storage_package_registry	\N	module_config.persistence.package_registry.startup_installation_specs.desc	\N	48	package_registry.startup_installation_specs	module_config.persistence.package_registry.startup_installation_specs	f	STRING_MULTILINE	5
216	f	fhir_storage_package_registry	false	module_config.persistence.package_registry.load_specs_asynchronously.desc	\N	49	package_registry.load_specs_asynchronously	module_config.persistence.package_registry.load_specs_asynchronously	f	BOOLEAN	5
217	f	fhir_storage_module_validation_svcs	NOT_VALIDATED	module_config.persistence.validator.local_reference_policy.desc	ca.cdr.api.model.enm.ReferenceValidationPolicyEnum	50	validator.local_reference_policy	module_config.persistence.validator.local_reference_policy	f	ENUM	5
218	f	fhir_storage_module_validation_svcs	GENERATE_ERROR	module_config.persistence.validator.unknown_codesystem_validation_policy.desc	ca.cdr.api.model.enm.UnknownCodeSystemValidationPolicyEnum	51	validator.unknown_codesystem_validation_policy	module_config.persistence.validator.unknown_codesystem_validation_policy	f	ENUM	5
219	f	request_validating	\N	module_config.persistence.request_validating.bean_types.desc	\N	52	request_validating.bean_types	module_config.persistence.request_validating.bean_types	f	STRING	5
220	f	fhir_storage_module_validation_svcs	false	module_config.persistence.remote_term_svc.enabled.desc	\N	53	remote_term_svc.enabled	module_config.persistence.remote_term_svc.enabled	f	BOOLEAN	5
221	f	fhir_storage_module_validation_svcs	\N	module_config.persistence.remote_term_svc.base_url.desc	\N	54	remote_term_svc.base_url	module_config.persistence.remote_term_svc.base_url	f	STRING	5
222	f	fhir_storage_module_validation_svcs	\N	module_config.persistence.remote_term_svc.base_url_username.desc	\N	55	remote_term_svc.base_url_username	module_config.persistence.remote_term_svc.base_url_username	f	STRING	5
223	f	fhir_storage_module_validation_svcs	\N	module_config.persistence.remote_term_svc.base_url_password.desc	\N	56	remote_term_svc.base_url_password	module_config.persistence.remote_term_svc.base_url_password	f	PASSWORD	5
224	f	fhir_storage_module_validation_svcs	false	module_config.persistence.remote_term_svc.log_http_calls.desc	\N	57	remote_term_svc.log_http_calls	module_config.persistence.remote_term_svc.log_http_calls	f	BOOLEAN	5
225	f	fhir_storage_module_validation_svcs	\N	module_config.persistence.validator.suppress_validation_message_patterns.desc	\N	58	validator.suppress_validation_message_patterns	module_config.persistence.validator.suppress_validation_message_patterns	f	STRING_MULTILINE	5
226	f	fhir_storage_module_validation_svcs	false	module_config.persistence.validator.skip.contained.reference.desc	\N	59	validator.skip.contained.reference	module_config.persistence.validator.skip.contained.reference	f	BOOLEAN	5
227	f	fhir_storage_module_scheduled_tasks	8	module_config.persistence.scheduled_tasks.batch_job_max_threads.desc	\N	60	scheduled_tasks.batch_job_max_threads	module_config.persistence.scheduled_tasks.batch_job_max_threads	f	POSITIVE_INTEGER	5
228	f	fhir_storage_module_scheduled_tasks	30	module_config.persistence.batch.stale_job_retention_days.desc	\N	61	batch.stale_job_retention_days	module_config.persistence.batch.stale_job_retention_days	f	POSITIVE_INTEGER	5
229	f	database	\N	module_config.persistence.db_driver.desc	ca.cdr.api.model.enm.DriverTypeEnum	62	db.driver	module_config.persistence.db_driver	f	ENUM	5
230	f	database	\N	module_config.persistence.db_url.desc	\N	63	db.url	module_config.persistence.db_url	f	STRING	5
231	f	database	\N	module_config.persistence.db_username.desc	\N	64	db.username	module_config.persistence.db_username	f	STRING	5
232	f	database	\N	module_config.persistence.db_password.desc	\N	65	db.password	module_config.persistence.db_password	f	PASSWORD	5
233	f	database	NONE	module_config.persistence.db_secrets_manager.desc	ca.cdr.api.database.DBSecretsManager	66	db.secrets_manager	module_config.persistence.db_secrets_manager	f	ENUM	5
234	f	database	UPDATE	module_config.persistence.db_schema_update_mode.desc	ca.cdr.api.model.enm.SchemaUpdateModeEnum	67	db.schema_update_mode	module_config.persistence.db_schema_update_mode	f	ENUM	5
235	f	database	false	module_config.persistence.db.expect_writable.desc	\N	68	db.expect_writable	module_config.persistence.db.expect_writable	f	BOOLEAN	5
236	f	database	0	module_config.persistence.db.connectionpool.minidle.desc	\N	69	db.connectionpool.minidle	module_config.persistence.db.connectionpool.minidle	f	NON_NEGATIVE_INTEGER	5
238	f	database	8	module_config.persistence.db.connectionpool.maxtotal.desc	\N	71	db.connectionpool.maxtotal	module_config.persistence.db.connectionpool.maxtotal	f	POSITIVE_INTEGER	5
239	f	database	\N	module_config.persistence.db.connectionpool.maxlifetime.millis.desc	\N	72	db.connectionpool.maxlifetime.millis	module_config.persistence.db.connectionpool.maxlifetime.millis	t	POSITIVE_INTEGER	5
240	f	database	30	module_config.persistence.db.connectionpool.maxwait_seconds.desc	\N	73	db.connectionpool.maxwait_seconds	module_config.persistence.db.connectionpool.maxwait_seconds	f	POSITIVE_INTEGER	5
241	f	database	60	module_config.persistence.db.connectionpool.default_query_timeout_seconds.desc	\N	74	db.connectionpool.default_query_timeout_seconds	module_config.persistence.db.connectionpool.default_query_timeout_seconds	f	NON_NEGATIVE_INTEGER	5
242	f	database	false	module_config.persistence.db.connectionpool.pool_prepared_statements.desc	\N	75	db.connectionpool.pool_prepared_statements	module_config.persistence.db.connectionpool.pool_prepared_statements	f	BOOLEAN	5
243	f	database	true	module_config.persistence.db.connectionpool.test_on_return.desc	\N	76	db.connectionpool.test_on_return	module_config.persistence.db.connectionpool.test_on_return	f	BOOLEAN	5
244	f	database	false	module_config.persistence.db.connectionpool.log_abandoned.desc	\N	77	db.connectionpool.log_abandoned	module_config.persistence.db.connectionpool.log_abandoned	f	BOOLEAN	5
245	f	database	false	module_config.persistence.db.connectionpool.remove_abandoned_on_borrow.desc	\N	78	db.connectionpool.remove_abandoned_on_borrow	module_config.persistence.db.connectionpool.remove_abandoned_on_borrow	f	BOOLEAN	5
246	f	database	300	module_config.persistence.db.connectionpool.remove_abandoned_timeout_seconds.desc	\N	79	db.connectionpool.remove_abandoned_timeout_seconds	module_config.persistence.db.connectionpool.remove_abandoned_timeout_seconds	f	NON_NEGATIVE_INTEGER	5
247	f	fhir_interceptors	\N	module_config.persistence.callback_script.text.desc	\N	80	callback_script.text	module_config.persistence.callback_script.text	t	JAVASCRIPT	5
248	f	fhir_interceptors	\N	module_config.persistence.callback_script.file.desc	\N	81	callback_script.file	module_config.persistence.callback_script.file	t	LOCAL_FILEPATH	5
249	f	database	NEVER_INLINE	module_config.persistence.db.sql_parameter_bind_mode.desc	ca.cdr.api.model.enm.SqlParameterBindModeEnum	82	db.sql_parameter_bind_mode	module_config.persistence.db.sql_parameter_bind_mode	f	ENUM	5
250	f	fhir_subscription_persistence	5	module_config.persistence.subscription.consumers_per_matching_queue.desc	\N	83	subscription.consumers_per_matching_queue	module_config.persistence.subscription.consumers_per_matching_queue	t	POSITIVE_INTEGER	5
251	f	fhir_subscription_persistence	2	module_config.persistence.subscription.consumers_per_delivery_queue.desc	\N	84	subscription.consumers_per_delivery_queue	module_config.persistence.subscription.consumers_per_delivery_queue	t	POSITIVE_INTEGER	5
252	f	fhir_subscription_persistence	false	module_config.persistence.subscription.rest_hook.enabled.desc	\N	85	subscription.rest_hook.enabled	module_config.persistence.subscription.rest_hook.enabled	f	BOOLEAN	5
253	f	fhir_subscription_persistence	false	module_config.persistence.subscription.email.enabled.desc	\N	86	subscription.email.enabled	module_config.persistence.subscription.email.enabled	f	BOOLEAN	5
254	f	fhir_subscription_persistence	false	module_config.persistence.subscription.websocket.enabled.desc	\N	87	subscription.websocket.enabled	module_config.persistence.subscription.websocket.enabled	f	BOOLEAN	5
255	f	fhir_subscription_persistence	false	module_config.persistence.subscription.message.enabled.desc	\N	88	subscription.message.enabled	module_config.persistence.subscription.message.enabled	f	BOOLEAN	5
256	f	fhir_subscription_persistence	true	module_config.persistence.subscription.trigger_on_non_versioning_changes.desc	\N	89	subscription.trigger_on_non_versioning_changes	module_config.persistence.subscription.trigger_on_non_versioning_changes	f	BOOLEAN	5
257	f	fhir_repository_validation	\N	module_config.persistence.javascript_repository_validation.script.text.desc	\N	90	javascript_repository_validation.script.text	module_config.persistence.javascript_repository_validation.script.text	t	JAVASCRIPT	5
258	f	fhir_repository_validation	\N	module_config.persistence.javascript_repository_validation.script.file.desc	\N	91	javascript_repository_validation.script.file	module_config.persistence.javascript_repository_validation.script.file	t	LOCAL_FILEPATH	5
259	f	fhir_storage_versioned_reference	\N	module_config.persistence.versioned_references.allow_at_paths.desc	\N	92	versioned_references.allow_at_paths	module_config.persistence.versioned_references.allow_at_paths	f	STRING_MULTILINE	5
260	f	fhir_storage_versioned_reference	false	module_config.persistence.versioned_references.allow_all.desc	\N	93	versioned_references.allow_all	module_config.persistence.versioned_references.allow_all	f	BOOLEAN	5
261	f	search_parameter_seeding	\N	module_config.persistence.search_parameter_seeding.disable_patterns.desc	\N	94	search_parameter_seeding.disable_patterns	module_config.persistence.search_parameter_seeding.disable_patterns	f	STRING_MULTILINE	5
262	f	search_parameter_seeding	\N	module_config.persistence.search_parameter_seeding.enable_patterns.desc	\N	95	search_parameter_seeding.enable_patterns	module_config.persistence.search_parameter_seeding.enable_patterns	f	STRING_MULTILINE	5
263	f	fhir_performance_tracing	false	module_config.persistence.performance_tracing.enabled.desc	\N	96	performance_tracing.enabled	module_config.persistence.performance_tracing.enabled	t	BOOLEAN	5
264	f	fhir_performance_tracing	true	module_config.persistence.performance_tracing.output.transaction_log.desc	\N	97	performance_tracing.output.transaction_log	module_config.persistence.performance_tracing.output.transaction_log	t	BOOLEAN	5
265	f	fhir_performance_tracing	false	module_config.persistence.performance_tracing.output.system_log.desc	\N	98	performance_tracing.output.system_log	module_config.persistence.performance_tracing.output.system_log	t	BOOLEAN	5
266	f	fhir_performance_tracing	true	module_config.persistence.performance_tracing.output.response_headers.desc	\N	99	performance_tracing.output.response_headers	module_config.persistence.performance_tracing.output.response_headers	t	BOOLEAN	5
267	f	fhir_performance_tracing	true	module_config.persistence.performance_tracing.capture.raw_sql.desc	\N	100	performance_tracing.capture.raw_sql	module_config.persistence.performance_tracing.capture.raw_sql	t	BOOLEAN	5
268	f	fhir_performance_tracing	ALL_REQUESTS	module_config.persistence.performance_tracing.capture.trigger.desc	ca.cdr.api.model.enm.StoragePerformanceTracingTriggerEnum	101	performance_tracing.capture.trigger	module_config.persistence.performance_tracing.capture.trigger	t	ENUM	5
269	f	fhir_search	true	module_config.persistence.graphql.enabled.desc	\N	102	graphql.enabled	module_config.persistence.graphql.enabled	f	BOOLEAN	5
270	f	fhir_search	false	module_config.persistence.identifier_of_type.enabled.desc	\N	103	identifier_of_type.enabled	module_config.persistence.identifier_of_type.enabled	f	BOOLEAN	5
271	f	fhir_configuration	false	module_config.persistence.dao_config.allow_multiple_delete.enabled.desc	\N	104	dao_config.allow_multiple_delete.enabled	module_config.persistence.dao_config.allow_multiple_delete.enabled	f	BOOLEAN	5
272	f	fhir_configuration	false	module_config.persistence.dao_config.allow_inline_match_url_references.enabled.desc	\N	105	dao_config.allow_inline_match_url_references.enabled	module_config.persistence.dao_config.allow_inline_match_url_references.enabled	f	BOOLEAN	5
273	f	fhir_configuration	false	module_config.persistence.dao_config.allow_external_references.enabled.desc	\N	106	dao_config.allow_external_references.enabled	module_config.persistence.dao_config.allow_external_references.enabled	f	BOOLEAN	5
274	f	fhir_configuration	true	module_config.persistence.dao_config.enforce_referential_integrity_on_write.enabled.desc	\N	107	dao_config.enforce_referential_integrity_on_write.enabled	module_config.persistence.dao_config.enforce_referential_integrity_on_write.enabled	f	BOOLEAN	5
275	f	fhir_configuration	true	module_config.persistence.dao_config.enforce_referential_integrity_on_delete.enabled.desc	\N	108	dao_config.enforce_referential_integrity_on_delete.enabled	module_config.persistence.dao_config.enforce_referential_integrity_on_delete.enabled	f	BOOLEAN	5
276	f	fhir_configuration	\N	module_config.persistence.dao_config.enforce_referential_integrity_on_delete.disable_for_paths.desc	\N	109	dao_config.enforce_referential_integrity_on_delete.disable_for_paths	module_config.persistence.dao_config.enforce_referential_integrity_on_delete.disable_for_paths	f	STRING_MULTILINE	5
277	f	fhir_configuration	false	module_config.persistence.dao_config.auto_create_placeholder_reference_targets.enabled.desc	\N	110	dao_config.auto_create_placeholder_reference_targets.enabled	module_config.persistence.dao_config.auto_create_placeholder_reference_targets.enabled	f	BOOLEAN	5
278	f	fhir_configuration	false	module_config.persistence.dao_config.mark_resources_for_reindexing_after_sp_change.desc	\N	111	dao_config.mark_resources_for_reindexing_after_sp_change	module_config.persistence.dao_config.mark_resources_for_reindexing_after_sp_change	f	BOOLEAN	5
279	f	fhir_configuration	SEQUENTIAL_NUMERIC	module_config.persistence.dao_config.server_id_mode.desc	ca.uhn.fhir.jpa.api.config.DaoConfig$IdStrategyEnum	112	dao_config.server_id_mode	module_config.persistence.dao_config.server_id_mode	f	ENUM	5
280	f	fhir_configuration	ALPHANUMERIC	module_config.persistence.dao_config.client_id_mode.desc	ca.uhn.fhir.jpa.api.config.DaoConfig$ClientIdStrategyEnum	113	dao_config.client_id_mode	module_config.persistence.dao_config.client_id_mode	f	ENUM	5
281	f	fhir_configuration	true	module_config.persistence.dao_config.enforce_reference_target_types.desc	\N	114	dao_config.enforce_reference_target_types	module_config.persistence.dao_config.enforce_reference_target_types	f	BOOLEAN	5
282	f	fhir_configuration	false	module_config.persistence.dao_config.expunge_operation_enabled.desc	\N	115	dao_config.expunge_operation_enabled	module_config.persistence.dao_config.expunge_operation_enabled	f	BOOLEAN	5
283	f	fhir_configuration	false	module_config.persistence.dao_config.delete_expunge_enabled.desc	\N	116	dao_config.delete_expunge_enabled	module_config.persistence.dao_config.delete_expunge_enabled	f	BOOLEAN	5
284	f	fhir_configuration	true	module_config.persistence.dao_config.reindex_enabled.desc	\N	117	dao_config.reindex_enabled	module_config.persistence.dao_config.reindex_enabled	f	BOOLEAN	5
285	f	fhir_configuration	false	module_config.persistence.dao_config.allow_storing_all_bundle_types.desc	\N	118	dao_config.allow_storing_all_bundle_types	module_config.persistence.dao_config.allow_storing_all_bundle_types	t	BOOLEAN	5
286	f	fhir_configuration	SOURCE_URI_AND_REQUEST_ID	module_config.persistence.dao_config.store_source_information.desc	ca.uhn.fhir.jpa.api.config.DaoConfig$StoreMetaSourceInformationEnum	119	dao_config.store_source_information	module_config.persistence.dao_config.store_source_information	f	ENUM	5
287	f	fhir_configuration	NON_VERSIONED	module_config.persistence.dao_config.tag_storage_mode.desc	ca.uhn.fhir.jpa.api.config.DaoConfig$TagStorageModeEnum	120	dao_config.tag_storage_mode	module_config.persistence.dao_config.tag_storage_mode	t	ENUM	5
288	f	fhir_configuration	60	module_config.persistence.dao_config.delete_child_resource.count.desc	\N	121	dao_config.delete_child_resource.count	module_config.persistence.dao_config.delete_child_resource.count	t	NON_NEGATIVE_INTEGER	5
289	f	lucene_fulltext_indexing	\N	module_config.persistence.db.hibernate_search.elasticsearch.index_prefix.desc	\N	122	db.hibernate_search.elasticsearch.index_prefix	module_config.persistence.db.hibernate_search.elasticsearch.index_prefix	f	STRING	5
290	f	lucene_fulltext_indexing	false	module_config.persistence.db.hibernate_search.index.search_params.desc	\N	123	db.hibernate_search.index.search_params	module_config.persistence.db.hibernate_search.index.search_params	f	BOOLEAN	5
291	f	fhir_search	true	module_config.persistence.dao_config.use_2020_new_search_builder.desc	\N	124	dao_config.use_2020_new_search_builder	module_config.persistence.dao_config.use_2020_new_search_builder	f	BOOLEAN	5
292	f	fhir_search	\N	module_config.persistence.dao_config.fetch_size.default_maximum.desc	\N	125	dao_config.fetch_size.default_maximum	module_config.persistence.dao_config.fetch_size.default_maximum	t	POSITIVE_INTEGER	5
293	f	fhir_search	false	module_config.persistence.dao_config.allow_contains_searches.desc	\N	126	dao_config.allow_contains_searches	module_config.persistence.dao_config.allow_contains_searches	f	BOOLEAN	5
294	f	fhir_search	true	module_config.persistence.dao_config.use_ordinal_dates_for_day_precision_searches.desc	\N	127	dao_config.use_ordinal_dates_for_day_precision_searches	module_config.persistence.dao_config.use_ordinal_dates_for_day_precision_searches	f	BOOLEAN	5
295	f	fhir_search	DISABLED	module_config.persistence.dao_config.index_contained_resources.desc	ca.cdr.pers.module.IndexContainedResourcesModeEnum	128	dao_config.index_contained_resources	module_config.persistence.dao_config.index_contained_resources	f	ENUM	5
296	f	fhir_search	DISABLED	module_config.persistence.dao_config.index_contained_resources_recursively.desc	ca.cdr.pers.module.IndexContainedResourcesModeEnum	129	dao_config.index_contained_resources_recursively	module_config.persistence.dao_config.index_contained_resources_recursively	f	ENUM	5
297	f	fhir_search	\N	module_config.persistence.dao_config.max_includes_to_load_per_page.desc	\N	130	dao_config.max_includes_to_load_per_page	module_config.persistence.dao_config.max_includes_to_load_per_page	t	POSITIVE_INTEGER	5
298	f	fhir_search	false	module_config.persistence.dao_config.legacy_202105_date_index_mode.desc	\N	131	dao_config.legacy_202105_date_index_mode	module_config.persistence.dao_config.legacy_202105_date_index_mode	f	BOOLEAN	5
299	f	fhir_search	false	module_config.persistence.filter_search.enabled.desc	\N	132	filter_search.enabled	module_config.persistence.filter_search.enabled	f	BOOLEAN	5
300	f	fhir_search	false	module_config.persistence.suppress_string_indexing_in_tokens.desc	\N	133	suppress_string_indexing_in_tokens	module_config.persistence.suppress_string_indexing_in_tokens	f	BOOLEAN	5
301	f	fhir_performance	60000	module_config.persistence.dao_config.reuse_cached_results_timeout_millis.desc	\N	134	dao_config.reuse_cached_results_timeout_millis	module_config.persistence.dao_config.reuse_cached_results_timeout_millis	t	NON_NEGATIVE_INTEGER	5
302	f	fhir_performance	60	module_config.persistence.dao_config.expire_search_results_after_minutes.desc	\N	135	dao_config.expire_search_results_after_minutes	module_config.persistence.dao_config.expire_search_results_after_minutes	f	POSITIVE_INTEGER	5
303	f	fhir_performance	\N	module_config.persistence.dao_config.default_total_mode.desc	ca.uhn.fhir.rest.api.SearchTotalModeEnum	136	dao_config.default_total_mode	module_config.persistence.dao_config.default_total_mode	t	ENUM	5
304	f	fhir_performance	800	module_config.persistence.dao_config.reindex_batch_size.desc	\N	137	dao_config.reindex_batch_size	module_config.persistence.dao_config.reindex_batch_size	t	NON_NEGATIVE_INTEGER	5
305	f	fhir_performance	2	module_config.persistence.dao_config.reindex_thread_count.desc	\N	138	dao_config.reindex_thread_count	module_config.persistence.dao_config.reindex_thread_count	t	NON_NEGATIVE_INTEGER	5
306	f	fhir_performance	800	module_config.persistence.dao_config.expunge_batch_size.desc	\N	139	dao_config.expunge_batch_size	module_config.persistence.dao_config.expunge_batch_size	t	NON_NEGATIVE_INTEGER	5
307	f	fhir_performance	2	module_config.persistence.dao_config.expunge_thread_count.desc	\N	140	dao_config.expunge_thread_count	module_config.persistence.dao_config.expunge_thread_count	t	NON_NEGATIVE_INTEGER	5
308	f	fhir_performance	true	module_config.persistence.dao_config.delete_enabled.desc	\N	141	dao_config.delete_enabled	module_config.persistence.dao_config.delete_enabled	t	BOOLEAN	5
309	f	fhir_performance	false	module_config.persistence.dao_config.match_url_cache.enabled.desc	\N	142	dao_config.match_url_cache.enabled	module_config.persistence.dao_config.match_url_cache.enabled	t	BOOLEAN	5
310	f	fhir_performance	\N	module_config.persistence.dao_config.maximum_transaction_bundle_size.desc	\N	143	dao_config.maximum_transaction_bundle_size	module_config.persistence.dao_config.maximum_transaction_bundle_size	t	POSITIVE_INTEGER	5
311	f	fhir_performance	10000	module_config.persistence.dao_config.internal_synchronous_search_size.desc	\N	144	dao_config.internal_synchronous_search_size	module_config.persistence.dao_config.internal_synchronous_search_size	t	POSITIVE_INTEGER	5
312	f	fhir_performance	false	module_config.persistence.dao_config.mass_ingestion_mode.desc	\N	145	dao_config.mass_ingestion_mode	module_config.persistence.dao_config.mass_ingestion_mode	t	BOOLEAN	5
313	f	fhir_performance	DISABLED	module_config.persistence.indexing.index_missing_search_params.desc	ca.uhn.fhir.jpa.api.config.DaoConfig$IndexEnabledEnum	146	indexing.index_missing_search_params	module_config.persistence.indexing.index_missing_search_params	f	ENUM	5
314	f	fhir_performance	false	module_config.persistence.dao_config.concurrent_bundle_validation.desc	\N	147	dao_config.concurrent_bundle_validation	module_config.persistence.dao_config.concurrent_bundle_validation	t	BOOLEAN	5
315	f	fhir_performance	4	module_config.persistence.dao_config.bundle_validation_thread_count.desc	\N	148	dao_config.bundle_validation_thread_count	module_config.persistence.dao_config.bundle_validation_thread_count	t	POSITIVE_INTEGER	5
316	f	fhir_performance	0	module_config.persistence.dao_config.inline_resource_storage_below_size.desc	\N	149	dao_config.inline_resource_storage_below_size	module_config.persistence.dao_config.inline_resource_storage_below_size	t	NON_NEGATIVE_INTEGER	5
317	f	fhir_mdm	false	module_config.persistence.mdm.search_expansion.enabled.desc	\N	150	mdm.search_expansion.enabled	module_config.persistence.mdm.search_expansion.enabled	f	BOOLEAN	5
318	f	fhir_storage_module_scheduled_tasks	ENABLED	module_config.persistence.scheduled_tasks.bulk_import.enabled.desc	ca.cdr.pers.module.ScheduledTaskEnabledEnum	151	scheduled_tasks.bulk_import.enabled	module_config.persistence.scheduled_tasks.bulk_import.enabled	f	ENUM	5
319	f	fhir_storage_module_scheduled_tasks	ENABLED	module_config.persistence.scheduled_tasks.bulk_export.enabled.desc	ca.cdr.pers.module.ScheduledTaskEnabledEnum	152	scheduled_tasks.bulk_export.enabled	module_config.persistence.scheduled_tasks.bulk_export.enabled	f	ENUM	5
320	f	fhir_storage_module_scheduled_tasks	ENABLED	module_config.persistence.scheduled_tasks.pre_expand_valuesets.enabled.desc	ca.cdr.pers.module.ScheduledTaskEnabledEnum	153	scheduled_tasks.pre_expand_valuesets.enabled	module_config.persistence.scheduled_tasks.pre_expand_valuesets.enabled	f	ENUM	5
321	f	fhir_storage_module_scheduled_tasks	ENABLED	module_config.persistence.scheduled_tasks.delete_stale_searches.enabled.desc	ca.cdr.pers.module.ScheduledTaskEnabledEnum	154	scheduled_tasks.delete_stale_searches.enabled	module_config.persistence.scheduled_tasks.delete_stale_searches.enabled	f	ENUM	5
322	f	fhir_storage_module_scheduled_tasks	ENABLED	module_config.persistence.scheduled_tasks.resource_reindexing.enabled.desc	ca.cdr.pers.module.ScheduledTaskEnabledEnum	155	scheduled_tasks.resource_reindexing.enabled	module_config.persistence.scheduled_tasks.resource_reindexing.enabled	f	ENUM	5
323	f	fhir_storage_versioned_reference	\N	module_config.persistence.versioned_references.auto_at_paths.desc	\N	156	versioned_references.auto_at_paths	module_config.persistence.versioned_references.auto_at_paths	f	STRING_MULTILINE	5
324	f	fhir_storage_versioned_reference	false	module_config.persistence.versioned_references.respect_for_search_includes.desc	\N	157	versioned_references.respect_for_search_includes	module_config.persistence.versioned_references.respect_for_search_includes	f	BOOLEAN	5
325	f	fhir_subscription_delivery	SUBSCRIPTION_ID	module_config.subscription.delivery_queue_naming.desc	ca.cdr.subs.delivery.SubscriptionDeliveryQueueNamingEnum	0	delivery_queue_naming	module_config.subscription.delivery_queue_naming	t	ENUM	6
326	f	fhir_subscription_delivery	noreply@unknown.com	module_config.subscription.model_config.email.from_address.desc	\N	1	model_config.email.from_address	module_config.subscription.model_config.email.from_address	t	STRING	6
327	f	fhir_interceptors	\N	module_config.persistence.interceptor_bean_types.desc	\N	2	interceptor_bean_types	module_config.persistence.interceptor_bean_types	f	STRING	6
328	f	fhir_rest_endpoint	\N	module_config.fhir_endpoint_servlet.base_url_fixed.desc	\N	0	base_url.fixed	module_config.fhir_endpoint_servlet.base_url_fixed	f	STRING	7
329	f	fhir_rest_endpoint	true	module_config.fhir_endpoint_servlet.default_pretty_print.desc	\N	1	default_pretty_print	module_config.fhir_endpoint_servlet.default_pretty_print	f	BOOLEAN	7
330	f	fhir_rest_endpoint	JSON	module_config.fhir_endpoint_servlet.default_encoding.desc	ca.uhn.fhir.rest.api.EncodingEnum	2	default_encoding	module_config.fhir_endpoint_servlet.default_encoding	f	ENUM	7
331	f	fhir_rest_endpoint	REPRESENTATION	module_config.fhir_endpoint_servlet.default_prefer_return.desc	ca.uhn.fhir.rest.api.PreferReturnEnum	3	default_prefer_return	module_config.fhir_endpoint_servlet.default_prefer_return	f	ENUM	7
332	f	fhir_rest_endpoint	false	module_config.fhir_endpoint_servlet.serve_raw_media_resource.desc	\N	4	serve_raw_media_resource	module_config.fhir_endpoint_servlet.serve_raw_media_resource	f	BOOLEAN	7
333	f	fhir_rest_endpoint	false	module_config.fhir_endpoint_servlet.process_request_header.request_source_enabled.desc	\N	5	process_request_header.request_source_enabled	module_config.fhir_endpoint_servlet.process_request_header.request_source_enabled	f	BOOLEAN	7
334	f	fhir_endpoint_interceptors	\N	module_config.fhir_endpoint_servlet.interceptor_bean_types.desc	\N	6	interceptor_bean_types	module_config.fhir_endpoint_servlet.interceptor_bean_types	f	STRING	7
335	f	fhir_endpoint_interceptors	\N	module_config.fhir_endpoint_servlet.custom_interceptor_can_replace_authorization_interceptor.desc	\N	7	custom_interceptor_can_replace_authorization_interceptor	module_config.fhir_endpoint_servlet.custom_interceptor_can_replace_authorization_interceptor	f	BOOLEAN	7
336	f	browser_syntax_highlighting	true	module_config.fhir_endpoint_servlet.browser_syntax_highlighting.enabled.desc	\N	8	browser_syntax_highlighting.enabled	module_config.fhir_endpoint_servlet.browser_syntax_highlighting.enabled	f	BOOLEAN	7
337	f	browser_syntax_highlighting	false	module_config.fhir_endpoint_servlet.browser_syntax_highlighting.show_request_headers.desc	\N	9	browser_syntax_highlighting.show_request_headers	module_config.fhir_endpoint_servlet.browser_syntax_highlighting.show_request_headers	f	BOOLEAN	7
338	f	browser_syntax_highlighting	true	module_config.fhir_endpoint_servlet.browser_syntax_highlighting.show_response_headers.desc	\N	10	browser_syntax_highlighting.show_response_headers	module_config.fhir_endpoint_servlet.browser_syntax_highlighting.show_response_headers	f	BOOLEAN	7
339	f	request_validating	false	module_config.fhir_endpoint_servlet.request_validating.enabled.desc	\N	11	request_validating.enabled	module_config.fhir_endpoint_servlet.request_validating.enabled	f	BOOLEAN	7
340	f	fhir_endpoint_conversion	false	module_config.fhir_endpoint.fhir_endpoint_conversion.enabled.desc	\N	12	fhir_endpoint_conversion.enabled	module_config.fhir_endpoint.fhir_endpoint_conversion.enabled	t	BOOLEAN	7
341	f	fhir_endpoint_security	false	module_config.fhir_endpoint.fhir_endpoint_security.automatically_narrow_search_scope.desc	\N	13	fhir_endpoint_security.automatically_narrow_search_scope	module_config.fhir_endpoint.fhir_endpoint_security.automatically_narrow_search_scope	t	BOOLEAN	7
342	f	fhir_endpoint_security	false	module_config.fhir_endpoint.fhir_endpoint_security.reject_insufficient_permissions_with_401.desc	\N	14	fhir_endpoint_security.reject_insufficient_permissions_with_401	module_config.fhir_endpoint.fhir_endpoint_security.reject_insufficient_permissions_with_401	t	BOOLEAN	7
343	f	fhir_endpoint_security	false	module_config.fhir_endpoint.fhir_endpoint_security.allow_compartment_searches.desc	\N	15	fhir_endpoint_security.allow_compartment_searches	module_config.fhir_endpoint.fhir_endpoint_security.allow_compartment_searches	t	BOOLEAN	7
344	f	fhir_consent_service	false	module_config.fhir_endpoint_servlet.consent_service.enabled.desc	\N	16	consent_service.enabled	module_config.fhir_endpoint_servlet.consent_service.enabled	t	BOOLEAN	7
345	f	fhir_consent_service	\N	module_config.fhir_endpoint_servlet.consent_service.script.text.desc	\N	17	consent_service.script.text	module_config.fhir_endpoint_servlet.consent_service.script.text	t	JAVASCRIPT	7
346	f	fhir_consent_service	\N	module_config.fhir_endpoint_servlet.consent_service.script.file.desc	\N	18	consent_service.script.file	module_config.fhir_endpoint_servlet.consent_service.script.file	t	LOCAL_FILEPATH	7
347	f	fhir_endpoint_terminology	false	module_config.fhir_endpoint_servlet.fhir_endpoint_terminology.response.populate_display.enabled.desc	\N	19	fhir_endpoint_terminology.response.populate_display.enabled	module_config.fhir_endpoint_servlet.fhir_endpoint_terminology.response.populate_display.enabled	t	BOOLEAN	7
348	f	fhir_endpoint_terminology	false	module_config.fhir_endpoint_servlet.fhir_endpoint_terminology.response.translation_enabled.desc	\N	20	fhir_endpoint_terminology.response.translation_enabled	module_config.fhir_endpoint_servlet.fhir_endpoint_terminology.response.translation_enabled	t	BOOLEAN	7
349	f	fhir_endpoint_terminology	\N	module_config.fhir_endpoint_servlet.fhir_endpoint_terminology.response.translation_spec.text.desc	\N	21	fhir_endpoint_terminology.response.translation_spec.text	module_config.fhir_endpoint_servlet.fhir_endpoint_terminology.response.translation_spec.text	t	JSON	7
350	f	fhir_capability_statement	FHIR Endpoint powered by Smile CDR	module_config.fhir_endpoint_servlet.fhir_endpoint_capabilty_statement.implementation.description.desc	\N	22	fhir_endpoint_capabilty_statement.implementation.description	module_config.fhir_endpoint_servlet.fhir_endpoint_capabilty_statement.implementation.description	t	STRING	7
351	f	fhir_capability_statement	\N	module_config.fhir_endpoint_servlet.fhir_endpoint_capabilty_statement.copyright.desc	\N	23	fhir_endpoint_capabilty_statement.copyright	module_config.fhir_endpoint_servlet.fhir_endpoint_capabilty_statement.copyright	t	STRING_MULTILINE	7
421	f	sessions	false	module_config.base_jetty_server.use_inmemory_sessions.desc	\N	19	sessions.inmemory	module_config.base_jetty_server.use_inmemory_sessions	f	BOOLEAN	8
352	f	fhir_capability_statement	true	module_config.fhir_endpoint_servlet.fhir_endpoint_capabilty_statement.openapi.enabled.desc	\N	24	fhir_endpoint_capabilty_statement.openapi.enabled	module_config.fhir_endpoint_servlet.fhir_endpoint_capabilty_statement.openapi.enabled	t	BOOLEAN	7
353	f	http_listener	\N	module_config.base_jetty_server.port.desc	\N	25	port	module_config.base_jetty_server.port	f	POSITIVE_INTEGER	7
354	f	http_listener	0.0.0.0	module_config.base_jetty_server.bind_address.desc	\N	26	bind_address	module_config.base_jetty_server.bind_address	f	STRING	7
355	f	http_listener	/	module_config.base_jetty_server.context_path.desc	\N	27	context_path	module_config.base_jetty_server.context_path	t	STRING	7
356	f	http_listener	/endpoint-health	module_config.base_jetty_server.endpoint_health.path.desc	\N	28	endpoint_health.path	module_config.base_jetty_server.endpoint_health.path	t	STRING	7
357	f	http_listener	false	module_config.base_jetty_server.respect_forward_headers.desc	\N	29	respect_forward_headers	module_config.base_jetty_server.respect_forward_headers	f	BOOLEAN	7
358	f	http_listener	false	module_config.base_jetty_server.https_forwarding_assumed.desc	\N	30	https_forwarding_assumed	module_config.base_jetty_server.https_forwarding_assumed	f	BOOLEAN	7
359	f	http_security	\N	module_config.base_jetty_server.pin_host.desc	\N	31	pin_host	module_config.base_jetty_server.pin_host	t	STRING	7
360	f	http_security	false	module_config.base_jetty_server.suppress_platform_info	\N	32	suppress_platform_info	module_config.base_jetty_server.suppress_platform_info	t	BOOLEAN	7
361	f	http_security	false	module_config.base_jetty_server.suppress_error_details.desc	\N	33	suppress_error_details	module_config.base_jetty_server.suppress_error_details	t	BOOLEAN	7
362	f	http_security	false	module_config.base_jetty_server.block_http_head.desc	\N	34	block_http_head	module_config.base_jetty_server.block_http_head	t	BOOLEAN	7
363	f	http_security	false	module_config.base_jetty_server.block_http_options.desc	\N	35	block_http_options	module_config.base_jetty_server.block_http_options	t	BOOLEAN	7
364	f	http_security	\N	module_config.base_jetty_server.custom_response_headers.desc	\N	36	custom_response_headers	module_config.base_jetty_server.custom_response_headers	t	STRING_MULTILINE	7
365	f	http_request_pool	5	module_config.base_jetty_server.threadpool_min.desc	\N	37	threadpool.min	module_config.base_jetty_server.threadpool_min	f	NON_NEGATIVE_INTEGER	7
366	f	http_request_pool	10	module_config.base_jetty_server.threadpool_max.desc	\N	38	threadpool.max	module_config.base_jetty_server.threadpool_max	f	POSITIVE_INTEGER	7
367	f	http_request_pool	\N	module_config.base_jetty_server.threadpool.accept_queue_size.desc	\N	39	threadpool.accept_queue_size	module_config.base_jetty_server.threadpool.accept_queue_size	f	NON_NEGATIVE_INTEGER	7
368	f	http_request_pool	8	module_config.base_jetty_server.max_header_size.request.kb.desc	\N	40	max_header_size.request.kb	module_config.base_jetty_server.max_header_size.request.kb	f	POSITIVE_INTEGER	7
369	f	http_request_pool	8	module_config.base_jetty_server.max_header_size.response.kb.desc	\N	41	max_header_size.response.kb	module_config.base_jetty_server.max_header_size.response.kb	f	POSITIVE_INTEGER	7
370	f	http_request_pool	30000	module_config.base_jetty_server.read_idle_timeout.millis.desc	\N	42	read_idle_timeout.millis	module_config.base_jetty_server.read_idle_timeout.millis	f	POSITIVE_INTEGER	7
371	f	sessions	false	module_config.base_jetty_server.use_inmemory_sessions.desc	\N	43	sessions.inmemory	module_config.base_jetty_server.use_inmemory_sessions	f	BOOLEAN	7
372	f	sessions	30	module_config.base_jetty_server.session_timeout_mins.desc	\N	44	sessions.timeout.mins	module_config.base_jetty_server.session_timeout_mins	f	POSITIVE_INTEGER	7
373	f	sessions	60000	module_config.base_jetty_server.session_scavenger_interval_millis.desc	\N	45	sessions.scavenger.interval.millis	module_config.base_jetty_server.session_scavenger_interval_millis	f	POSITIVE_INTEGER	7
374	f	http_access_log	\N	module_config.base_jetty_server.access_log.appenders.desc	\N	46	access_log.appenders	module_config.base_jetty_server.access_log.appenders	f	STRING_MULTILINE	7
375	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_file.desc	\N	47	tls.keystore.file	module_config.base_server.tls_keystore_file	t	LOCAL_FILEPATH	7
376	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_password.desc	\N	48	tls.keystore.password	module_config.base_server.tls_keystore_password	t	PASSWORD	7
377	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_keyalias.desc	\N	49	tls.keystore.keyalias	module_config.base_server.tls_keystore_keyalias	t	STRING	7
378	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_keypass.desc	\N	50	tls.keystore.keypass	module_config.base_server.tls_keystore_keypass	t	PASSWORD	7
379	f	tls_ssl_encryption	false	module_config.base_server.tls_enabled.desc	\N	51	tls.enabled	module_config.base_server.tls_enabled	f	BOOLEAN	7
380	f	tls_ssl_encryption	false	module_config.base_server.tls_clientauth_enabled.desc	\N	52	tls.clientauth.enabled	module_config.base_server.tls_clientauth_enabled	f	BOOLEAN	7
381	f	tls_ssl_encryption	\N	module_config.base_server.tls_truststore_file.desc	\N	53	tls.truststore.file	module_config.base_server.tls_truststore_file	t	LOCAL_FILEPATH	7
382	f	tls_ssl_encryption	\N	module_config.base_server.tls_truststore_password.desc	\N	54	tls.truststore.password	module_config.base_server.tls_truststore_password	t	PASSWORD	7
383	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.cipher_whitelist.desc	\N	55	tls.protocol.cipher_whitelist	module_config.base_server.tls.protocol.cipher_whitelist	t	STRING	7
384	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.cipher_blacklist.desc	\N	56	tls.protocol.cipher_blacklist	module_config.base_server.tls.protocol.cipher_blacklist	t	STRING	7
385	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.protocol_whitelist.desc	\N	57	tls.protocol.protocol_whitelist	module_config.base_server.tls.protocol.protocol_whitelist	t	STRING	7
386	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.protocol_blacklist.desc	\N	58	tls.protocol.protocol_blacklist	module_config.base_server.tls.protocol.protocol_blacklist	t	STRING	7
457	f	http_security	\N	module_config.base_jetty_server.pin_host.desc	\N	16	pin_host	module_config.base_jetty_server.pin_host	t	STRING	9
387	f	request_validating	ERROR	module_config.fhir_endpoint_servlet.request_validating.fail_on_severity.desc	ca.cdr.api.validator.enm.ConstrainedResultSeverityEnum	59	request_validating.fail_on_severity	module_config.fhir_endpoint_servlet.request_validating.fail_on_severity	f	ENUM	7
388	f	request_validating	false	module_config.fhir_endpoint_servlet.request_validating.tags.enabled.desc	\N	60	request_validating.tags.enabled	module_config.fhir_endpoint_servlet.request_validating.tags.enabled	f	BOOLEAN	7
389	f	request_validating	false	module_config.fhir_endpoint_servlet.request_validating.response_headers.enabled.desc	\N	61	request_validating.response_headers.enabled	module_config.fhir_endpoint_servlet.request_validating.response_headers.enabled	f	BOOLEAN	7
390	f	fhir_endpoint_partitioning	NONE	module_config.fhir_endpoint_servlet.partitioning.tenant_identification_strategy.desc	ca.cdr.api.model.enm.TenantIdentificationStrategyEnum	62	partitioning.tenant_identification_strategy	module_config.fhir_endpoint_servlet.partitioning.tenant_identification_strategy	f	ENUM	7
391	f	auth_general_for_apis	false	module_config.base_jetty_server.anonymous_access_enabled.desc	\N	63	anonymous.access.enabled	module_config.base_jetty_server.anonymous_access_enabled	f	BOOLEAN	7
392	f	auth_general_for_apis	ANONYMOUS	module_config.base_jetty_server.anonymous.access.account_username.desc	\N	64	anonymous.access.account_username	module_config.base_jetty_server.anonymous.access.account_username	f	STRING	7
393	f	auth_http_basic	false	module_config.base_jetty_server.security.http_basic.enabled.desc	\N	65	security.http.basic.enabled	module_config.base_jetty_server.security.http_basic.enabled	f	BOOLEAN	7
394	f	auth_http_basic	Smile CDR	module_config.base_jetty_server.security.http_basic.realm.desc	\N	66	security.http.basic.realm	module_config.base_jetty_server.security.http_basic.realm	f	STRING	7
395	f	auth_openid_connect	false	module_config.base_jetty_server.security.oic.enabled.desc	\N	67	security.oic.enabled	module_config.base_jetty_server.security.oic.enabled	f	BOOLEAN	7
396	f	trusted_client	false	module_config.base_jetty_server.trusted_client.enabled.desc	\N	68	trusted_client.enabled	module_config.base_jetty_server.trusted_client.enabled	f	BOOLEAN	7
397	f	trusted_client	false	module_config.base_jetty_server.trusted_client.assert_permissions.desc	\N	69	trusted_client.assert_permissions	module_config.base_jetty_server.trusted_client.assert_permissions	f	BOOLEAN	7
398	f	cross_origin_resource_sharing_cors	false	module_config.base_jetty_server.cors_enable.desc	\N	70	cors.enable	module_config.base_jetty_server.cors_enable	f	BOOLEAN	7
399	f	cross_origin_resource_sharing_cors	*	module_config.base_jetty_server.cors_origins.desc	\N	71	cors.origins	module_config.base_jetty_server.cors_origins	f	STRING	7
400	f	cross_origin_resource_sharing_cors	\N	module_config.base_jetty_server.cors_allowed_headers.desc	\N	72	cors.allowed_headers	module_config.base_jetty_server.cors_allowed_headers	f	STRING	7
401	f	http_security	\N	module_config.base_jetty_server.frame_options.allow_from.desc	\N	73	frame_options.allow_from	module_config.base_jetty_server.frame_options.allow_from	t	STRING	7
402	f	fhir_endpoint_partitioning	\N	module_config.fhirweb.partitioning.tenant_name.desc	\N	0	partitioning.tenant_name	module_config.fhirweb.partitioning.tenant_name	f	STRING	8
403	f	http_listener	\N	module_config.base_jetty_server.port.desc	\N	1	port	module_config.base_jetty_server.port	f	POSITIVE_INTEGER	8
404	f	http_listener	0.0.0.0	module_config.base_jetty_server.bind_address.desc	\N	2	bind_address	module_config.base_jetty_server.bind_address	f	STRING	8
405	f	http_listener	/	module_config.base_jetty_server.context_path.desc	\N	3	context_path	module_config.base_jetty_server.context_path	t	STRING	8
406	f	http_listener	/endpoint-health	module_config.base_jetty_server.endpoint_health.path.desc	\N	4	endpoint_health.path	module_config.base_jetty_server.endpoint_health.path	t	STRING	8
407	f	http_listener	false	module_config.base_jetty_server.respect_forward_headers.desc	\N	5	respect_forward_headers	module_config.base_jetty_server.respect_forward_headers	f	BOOLEAN	8
408	f	http_listener	false	module_config.base_jetty_server.https_forwarding_assumed.desc	\N	6	https_forwarding_assumed	module_config.base_jetty_server.https_forwarding_assumed	f	BOOLEAN	8
409	f	http_security	\N	module_config.base_jetty_server.pin_host.desc	\N	7	pin_host	module_config.base_jetty_server.pin_host	t	STRING	8
410	f	http_security	false	module_config.base_jetty_server.suppress_platform_info	\N	8	suppress_platform_info	module_config.base_jetty_server.suppress_platform_info	t	BOOLEAN	8
411	f	http_security	false	module_config.base_jetty_server.suppress_error_details.desc	\N	9	suppress_error_details	module_config.base_jetty_server.suppress_error_details	t	BOOLEAN	8
412	f	http_security	false	module_config.base_jetty_server.block_http_head.desc	\N	10	block_http_head	module_config.base_jetty_server.block_http_head	t	BOOLEAN	8
413	f	http_security	false	module_config.base_jetty_server.block_http_options.desc	\N	11	block_http_options	module_config.base_jetty_server.block_http_options	t	BOOLEAN	8
414	f	http_security	\N	module_config.base_jetty_server.custom_response_headers.desc	\N	12	custom_response_headers	module_config.base_jetty_server.custom_response_headers	t	STRING_MULTILINE	8
415	f	http_request_pool	5	module_config.base_jetty_server.threadpool_min.desc	\N	13	threadpool.min	module_config.base_jetty_server.threadpool_min	f	NON_NEGATIVE_INTEGER	8
416	f	http_request_pool	10	module_config.base_jetty_server.threadpool_max.desc	\N	14	threadpool.max	module_config.base_jetty_server.threadpool_max	f	POSITIVE_INTEGER	8
417	f	http_request_pool	\N	module_config.base_jetty_server.threadpool.accept_queue_size.desc	\N	15	threadpool.accept_queue_size	module_config.base_jetty_server.threadpool.accept_queue_size	f	NON_NEGATIVE_INTEGER	8
418	f	http_request_pool	8	module_config.base_jetty_server.max_header_size.request.kb.desc	\N	16	max_header_size.request.kb	module_config.base_jetty_server.max_header_size.request.kb	f	POSITIVE_INTEGER	8
419	f	http_request_pool	8	module_config.base_jetty_server.max_header_size.response.kb.desc	\N	17	max_header_size.response.kb	module_config.base_jetty_server.max_header_size.response.kb	f	POSITIVE_INTEGER	8
420	f	http_request_pool	30000	module_config.base_jetty_server.read_idle_timeout.millis.desc	\N	18	read_idle_timeout.millis	module_config.base_jetty_server.read_idle_timeout.millis	f	POSITIVE_INTEGER	8
422	f	sessions	30	module_config.base_jetty_server.session_timeout_mins.desc	\N	20	sessions.timeout.mins	module_config.base_jetty_server.session_timeout_mins	f	POSITIVE_INTEGER	8
423	f	sessions	60000	module_config.base_jetty_server.session_scavenger_interval_millis.desc	\N	21	sessions.scavenger.interval.millis	module_config.base_jetty_server.session_scavenger_interval_millis	f	POSITIVE_INTEGER	8
424	f	http_access_log	\N	module_config.base_jetty_server.access_log.appenders.desc	\N	22	access_log.appenders	module_config.base_jetty_server.access_log.appenders	f	STRING_MULTILINE	8
425	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_file.desc	\N	23	tls.keystore.file	module_config.base_server.tls_keystore_file	t	LOCAL_FILEPATH	8
426	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_password.desc	\N	24	tls.keystore.password	module_config.base_server.tls_keystore_password	t	PASSWORD	8
427	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_keyalias.desc	\N	25	tls.keystore.keyalias	module_config.base_server.tls_keystore_keyalias	t	STRING	8
428	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_keypass.desc	\N	26	tls.keystore.keypass	module_config.base_server.tls_keystore_keypass	t	PASSWORD	8
429	f	tls_ssl_encryption	false	module_config.base_server.tls_enabled.desc	\N	27	tls.enabled	module_config.base_server.tls_enabled	f	BOOLEAN	8
430	f	tls_ssl_encryption	false	module_config.base_server.tls_clientauth_enabled.desc	\N	28	tls.clientauth.enabled	module_config.base_server.tls_clientauth_enabled	f	BOOLEAN	8
431	f	tls_ssl_encryption	\N	module_config.base_server.tls_truststore_file.desc	\N	29	tls.truststore.file	module_config.base_server.tls_truststore_file	t	LOCAL_FILEPATH	8
432	f	tls_ssl_encryption	\N	module_config.base_server.tls_truststore_password.desc	\N	30	tls.truststore.password	module_config.base_server.tls_truststore_password	t	PASSWORD	8
433	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.cipher_whitelist.desc	\N	31	tls.protocol.cipher_whitelist	module_config.base_server.tls.protocol.cipher_whitelist	t	STRING	8
434	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.cipher_blacklist.desc	\N	32	tls.protocol.cipher_blacklist	module_config.base_server.tls.protocol.cipher_blacklist	t	STRING	8
435	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.protocol_whitelist.desc	\N	33	tls.protocol.protocol_whitelist	module_config.base_server.tls.protocol.protocol_whitelist	t	STRING	8
436	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.protocol_blacklist.desc	\N	34	tls.protocol.protocol_blacklist	module_config.base_server.tls.protocol.protocol_blacklist	t	STRING	8
437	f	auth_general_for_web	false	module_config.base_jetty_server.anonymous_access_enabled.desc	\N	35	anonymous.access.enabled	module_config.base_jetty_server.anonymous_access_enabled	f	BOOLEAN	8
438	f	auth_general_for_web	ANONYMOUS	module_config.base_jetty_server.anonymous.access.account_username.desc	\N	36	anonymous.access.account_username	module_config.base_jetty_server.anonymous.access.account_username	f	STRING	8
439	f	auth_general_for_web	false	module_config.base_jetty_server.saml.enabled.desc	\N	37	saml.enabled	module_config.base_jetty_server.saml.enabled	t	BOOLEAN	8
440	f	http_security	\N	module_config.base_jetty_server.frame_options.allow_from.desc	\N	38	frame_options.allow_from	module_config.base_jetty_server.frame_options.allow_from	t	STRING	8
441	f	openid_connect_oic	BCRYPT_12_ROUND	module_config.security_out_smart.client_secret.encoding.desc	ca.cdr.api.model.enm.PasswordEncodingTypeEnum	0	client_secret.encoding	module_config.security_out_smart.client_secret.encoding	t	ENUM	9
442	f	openid_connect_oic	365	module_config.security_out_smart.client_secret.expiry_duration_days.desc	\N	1	client_secret.expiry_duration_days	module_config.security_out_smart.client_secret.expiry_duration_days	t	STRING	9
443	f	openid_connect_oic	\N	module_config.security_out_smart.smart_capabilities_list.desc	\N	2	smart_capabilities_list	module_config.security_out_smart.smart_capabilities_list	t	STRING_MULTILINE	9
444	f	openid_connect_oic	false	module_config.security_out_smart.pkce.required.desc	\N	3	pkce.required	module_config.security_out_smart.pkce.required	t	BOOLEAN	9
445	f	openid_connect_oic	true	module_config.security_out_smart.pkce.plain_challenge_supported.desc	\N	4	pkce.plain_challenge_supported	module_config.security_out_smart.pkce.plain_challenge_supported	t	BOOLEAN	9
446	f	security_smart_authorization	true	module_config.security_in_smart.enforce_approved_scopes_to_restrict_permissions.desc	\N	5	enforce_approved_scopes_to_restrict_permissions	module_config.security_in_smart.enforce_approved_scopes_to_restrict_permissions	f	BOOLEAN	9
447	f	security_smart_authorization	openid fhirUser	module_config.security_in_smart.smart_configuration.scopes_supported.desc	\N	6	smart_configuration.scopes_supported	module_config.security_in_smart.smart_configuration.scopes_supported	t	STRING	9
448	f	security_oidc_federation	false	module_config.security_out_smart.federate_mode.enabled.desc	\N	7	federate_mode.enabled	module_config.security_out_smart.federate_mode.enabled	f	BOOLEAN	9
449	f	security_out_smart_tos	\N	module_config.security_out_smart.tos.version_string.desc	\N	8	tos.version_string	module_config.security_out_smart.tos.version_string	f	STRING	9
450	f	http_security	\N	module_config.base_jetty_server.frame_options.allow_from.desc	\N	9	frame_options.allow_from	module_config.base_jetty_server.frame_options.allow_from	t	STRING	9
451	f	http_listener	\N	module_config.base_jetty_server.port.desc	\N	10	port	module_config.base_jetty_server.port	f	POSITIVE_INTEGER	9
452	f	http_listener	0.0.0.0	module_config.base_jetty_server.bind_address.desc	\N	11	bind_address	module_config.base_jetty_server.bind_address	f	STRING	9
453	f	http_listener	/	module_config.base_jetty_server.context_path.desc	\N	12	context_path	module_config.base_jetty_server.context_path	t	STRING	9
454	f	http_listener	/endpoint-health	module_config.base_jetty_server.endpoint_health.path.desc	\N	13	endpoint_health.path	module_config.base_jetty_server.endpoint_health.path	t	STRING	9
455	f	http_listener	false	module_config.base_jetty_server.respect_forward_headers.desc	\N	14	respect_forward_headers	module_config.base_jetty_server.respect_forward_headers	f	BOOLEAN	9
456	f	http_listener	false	module_config.base_jetty_server.https_forwarding_assumed.desc	\N	15	https_forwarding_assumed	module_config.base_jetty_server.https_forwarding_assumed	f	BOOLEAN	9
458	f	http_security	false	module_config.base_jetty_server.suppress_platform_info	\N	17	suppress_platform_info	module_config.base_jetty_server.suppress_platform_info	t	BOOLEAN	9
459	f	http_security	false	module_config.base_jetty_server.suppress_error_details.desc	\N	18	suppress_error_details	module_config.base_jetty_server.suppress_error_details	t	BOOLEAN	9
460	f	http_security	false	module_config.base_jetty_server.block_http_head.desc	\N	19	block_http_head	module_config.base_jetty_server.block_http_head	t	BOOLEAN	9
461	f	http_security	false	module_config.base_jetty_server.block_http_options.desc	\N	20	block_http_options	module_config.base_jetty_server.block_http_options	t	BOOLEAN	9
462	f	http_security	\N	module_config.base_jetty_server.custom_response_headers.desc	\N	21	custom_response_headers	module_config.base_jetty_server.custom_response_headers	t	STRING_MULTILINE	9
463	f	http_request_pool	5	module_config.base_jetty_server.threadpool_min.desc	\N	22	threadpool.min	module_config.base_jetty_server.threadpool_min	f	NON_NEGATIVE_INTEGER	9
464	f	http_request_pool	10	module_config.base_jetty_server.threadpool_max.desc	\N	23	threadpool.max	module_config.base_jetty_server.threadpool_max	f	POSITIVE_INTEGER	9
465	f	http_request_pool	\N	module_config.base_jetty_server.threadpool.accept_queue_size.desc	\N	24	threadpool.accept_queue_size	module_config.base_jetty_server.threadpool.accept_queue_size	f	NON_NEGATIVE_INTEGER	9
466	f	http_request_pool	8	module_config.base_jetty_server.max_header_size.request.kb.desc	\N	25	max_header_size.request.kb	module_config.base_jetty_server.max_header_size.request.kb	f	POSITIVE_INTEGER	9
467	f	http_request_pool	8	module_config.base_jetty_server.max_header_size.response.kb.desc	\N	26	max_header_size.response.kb	module_config.base_jetty_server.max_header_size.response.kb	f	POSITIVE_INTEGER	9
468	f	http_request_pool	30000	module_config.base_jetty_server.read_idle_timeout.millis.desc	\N	27	read_idle_timeout.millis	module_config.base_jetty_server.read_idle_timeout.millis	f	POSITIVE_INTEGER	9
469	f	sessions	false	module_config.base_jetty_server.use_inmemory_sessions.desc	\N	28	sessions.inmemory	module_config.base_jetty_server.use_inmemory_sessions	f	BOOLEAN	9
470	f	sessions	30	module_config.base_jetty_server.session_timeout_mins.desc	\N	29	sessions.timeout.mins	module_config.base_jetty_server.session_timeout_mins	f	POSITIVE_INTEGER	9
471	f	sessions	60000	module_config.base_jetty_server.session_scavenger_interval_millis.desc	\N	30	sessions.scavenger.interval.millis	module_config.base_jetty_server.session_scavenger_interval_millis	f	POSITIVE_INTEGER	9
472	f	http_access_log	\N	module_config.base_jetty_server.access_log.appenders.desc	\N	31	access_log.appenders	module_config.base_jetty_server.access_log.appenders	f	STRING_MULTILINE	9
473	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_file.desc	\N	32	tls.keystore.file	module_config.base_server.tls_keystore_file	t	LOCAL_FILEPATH	9
474	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_password.desc	\N	33	tls.keystore.password	module_config.base_server.tls_keystore_password	t	PASSWORD	9
475	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_keyalias.desc	\N	34	tls.keystore.keyalias	module_config.base_server.tls_keystore_keyalias	t	STRING	9
476	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_keypass.desc	\N	35	tls.keystore.keypass	module_config.base_server.tls_keystore_keypass	t	PASSWORD	9
477	f	tls_ssl_encryption	false	module_config.base_server.tls_enabled.desc	\N	36	tls.enabled	module_config.base_server.tls_enabled	f	BOOLEAN	9
478	f	tls_ssl_encryption	false	module_config.base_server.tls_clientauth_enabled.desc	\N	37	tls.clientauth.enabled	module_config.base_server.tls_clientauth_enabled	f	BOOLEAN	9
479	f	tls_ssl_encryption	\N	module_config.base_server.tls_truststore_file.desc	\N	38	tls.truststore.file	module_config.base_server.tls_truststore_file	t	LOCAL_FILEPATH	9
480	f	tls_ssl_encryption	\N	module_config.base_server.tls_truststore_password.desc	\N	39	tls.truststore.password	module_config.base_server.tls_truststore_password	t	PASSWORD	9
481	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.cipher_whitelist.desc	\N	40	tls.protocol.cipher_whitelist	module_config.base_server.tls.protocol.cipher_whitelist	t	STRING	9
482	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.cipher_blacklist.desc	\N	41	tls.protocol.cipher_blacklist	module_config.base_server.tls.protocol.cipher_blacklist	t	STRING	9
483	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.protocol_whitelist.desc	\N	42	tls.protocol.protocol_whitelist	module_config.base_server.tls.protocol.protocol_whitelist	t	STRING	9
484	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.protocol_blacklist.desc	\N	43	tls.protocol.protocol_blacklist	module_config.base_server.tls.protocol.protocol_blacklist	t	STRING	9
485	f	openid_connect_oic	\N	module_config.security_out_smart.issuer.url.desc	\N	44	issuer.url	module_config.security_out_smart.issuer.url	f	STRING	9
486	f	json_web_keyset_jwks	\N	module_config.openid.signing.jwks_file.desc	\N	45	openid.signing.jwks_file	module_config.openid.signing.jwks_file	t	LOCAL_FILEPATH	9
487	f	json_web_keyset_jwks	\N	module_config.openid.signing.jwks_text.desc	\N	46	openid.signing.jwks_text	module_config.openid.signing.jwks_text	t	JSON	9
488	f	json_web_keyset_jwks	\N	module_config.openid.signing.key_id.desc	\N	47	openid.signing.key_id	module_config.openid.signing.key_id	t	STRING	9
489	f	security_out_smart_login_skin	\N	module_config.security_out_smart.skin.webjar_id.desc	\N	48	skin.webjar_id	module_config.security_out_smart.skin.webjar_id	t	STRING	9
490	f	security_out_smart_login_skin	\N	module_config.security_out_smart.skin.login_page.template.desc	\N	49	skin.login_page.template	module_config.security_out_smart.skin.login_page.template	t	STRING	9
491	f	security_out_smart_login_skin	\N	module_config.security_out_smart.skin.login_oauth2_page.template.desc	\N	50	skin.login_oauth2_page.template	module_config.security_out_smart.skin.login_oauth2_page.template	t	STRING	9
492	f	security_out_smart_login_skin	\N	module_config.security_out_smart.skin.approve_page.template.desc	\N	51	skin.approve_page.template	module_config.security_out_smart.skin.approve_page.template	t	STRING	9
527	f	http_request_pool	10	module_config.base_jetty_server.threadpool_max.desc	\N	13	threadpool.max	module_config.base_jetty_server.threadpool_max	f	POSITIVE_INTEGER	10
493	f	security_out_smart_login_skin	\N	module_config.security_out_smart.skin.session_management_page.template.desc	\N	52	skin.session_management_page.template	module_config.security_out_smart.skin.session_management_page.template	t	STRING	9
494	f	security_out_smart_login_skin	\N	module_config.security_out_smart.skin.error_page.template.desc	\N	53	skin.error_page.template	module_config.security_out_smart.skin.error_page.template	t	STRING	9
495	f	security_out_smart_login_skin	\N	module_config.security_out_smart.skin.tfa_page.template.desc	\N	54	skin.tfa_page.template	module_config.security_out_smart.skin.tfa_page.template	t	STRING	9
496	f	security_out_smart_login_skin	\N	module_config.security_out_smart.skin.tos_page.template.desc	\N	55	skin.tos_page.template	module_config.security_out_smart.skin.tos_page.template	t	STRING	9
497	f	security_out_smart_login_skin	\N	module_config.security_out_smart.skin.register_step1.template.desc	\N	56	skin.register_step1.template	module_config.security_out_smart.skin.register_step1.template	t	STRING	9
498	f	security_out_smart_login_skin	\N	module_config.security_out_smart.skin.register_step2.template.desc	\N	57	skin.register_step2.template	module_config.security_out_smart.skin.register_step2.template	t	STRING	9
499	f	cross_origin_resource_sharing_cors	false	module_config.base_jetty_server.cors_enable.desc	\N	58	cors.enable	module_config.base_jetty_server.cors_enable	f	BOOLEAN	9
500	f	cross_origin_resource_sharing_cors	*	module_config.base_jetty_server.cors_origins.desc	\N	59	cors.origins	module_config.base_jetty_server.cors_origins	f	STRING	9
501	f	cross_origin_resource_sharing_cors	\N	module_config.base_jetty_server.cors_allowed_headers.desc	\N	60	cors.allowed_headers	module_config.base_jetty_server.cors_allowed_headers	f	STRING	9
502	f	security_out_smart_codap	false	module_config.security_out_smart.codap.enabled.desc	\N	61	codap.enabled	module_config.security_out_smart.codap.enabled	t	BOOLEAN	9
503	f	security_out_smart_codap	\N	module_config.security_out_smart.codap.auth_script.text.desc	\N	62	codap.auth_script.text	module_config.security_out_smart.codap.auth_script.text	t	JAVASCRIPT	9
504	f	security_out_smart_codap	\N	module_config.security_out_smart.codap.auth_script.file.desc	\N	63	codap.auth_script.file	module_config.security_out_smart.codap.auth_script.file	t	LOCAL_FILEPATH	9
505	f	security_out_smart_callback	\N	module_config.security_out_smart.post_authorize_script.text.desc	\N	64	post_authorize_script.text	module_config.security_out_smart.post_authorize_script.text	t	JAVASCRIPT	9
506	f	security_out_smart_callback	\N	module_config.security_out_smart.post_authorize_script.file.desc	\N	65	post_authorize_script.file	module_config.security_out_smart.post_authorize_script.file	t	LOCAL_FILEPATH	9
507	f	openid_connect_oic	3000	module_config.security_out_smart.cache.authorized_tokens.millis.desc	\N	66	cache.authorized_tokens.millis	module_config.security_out_smart.cache.authorized_tokens.millis	t	NON_NEGATIVE_INTEGER	9
508	f	security_smart_seeding	\N	module_config.security_in_smart.seed_servers.file.desc	\N	67	seed_servers.file	module_config.security_in_smart.seed_servers.file	t	LOCAL_FILEPATH	9
509	f	security_smart_seeding	\N	module_config.security_in_smart.seed_clients.file.desc	\N	68	seed_clients.file	module_config.security_in_smart.seed_clients.file	t	LOCAL_FILEPATH	9
510	f	oidc_http_client	30	module_config.security_in_smart.introspection_client.jwks_cache.mins.desc	\N	69	introspection_client.jwks_cache.mins	module_config.security_in_smart.introspection_client.jwks_cache.mins	t	NON_NEGATIVE_INTEGER	9
511	f	oidc_http_client	\N	module_config.security_in_smart.introspection_client.truststore.file.desc	\N	70	introspection_client.truststore.file	module_config.security_in_smart.introspection_client.truststore.file	t	LOCAL_FILEPATH	9
512	f	oidc_http_client	\N	module_config.security_in_smart.introspection_client.truststore.password.desc	\N	71	introspection_client.truststore.password	module_config.security_in_smart.introspection_client.truststore.password	t	PASSWORD	9
513	f	openid_connect_oic	false	module_config.security_out_smart.rotate_refresh_token_after_use.desc	\N	72	rotate_refresh_token_after_use	module_config.security_out_smart.rotate_refresh_token_after_use	f	BOOLEAN	9
514	f	http_listener	\N	module_config.base_jetty_server.port.desc	\N	0	port	module_config.base_jetty_server.port	f	POSITIVE_INTEGER	10
515	f	http_listener	0.0.0.0	module_config.base_jetty_server.bind_address.desc	\N	1	bind_address	module_config.base_jetty_server.bind_address	f	STRING	10
516	f	http_listener	/	module_config.base_jetty_server.context_path.desc	\N	2	context_path	module_config.base_jetty_server.context_path	t	STRING	10
517	f	http_listener	/endpoint-health	module_config.base_jetty_server.endpoint_health.path.desc	\N	3	endpoint_health.path	module_config.base_jetty_server.endpoint_health.path	t	STRING	10
518	f	http_listener	false	module_config.base_jetty_server.respect_forward_headers.desc	\N	4	respect_forward_headers	module_config.base_jetty_server.respect_forward_headers	f	BOOLEAN	10
519	f	http_listener	false	module_config.base_jetty_server.https_forwarding_assumed.desc	\N	5	https_forwarding_assumed	module_config.base_jetty_server.https_forwarding_assumed	f	BOOLEAN	10
520	f	http_security	\N	module_config.base_jetty_server.pin_host.desc	\N	6	pin_host	module_config.base_jetty_server.pin_host	t	STRING	10
521	f	http_security	false	module_config.base_jetty_server.suppress_platform_info	\N	7	suppress_platform_info	module_config.base_jetty_server.suppress_platform_info	t	BOOLEAN	10
522	f	http_security	false	module_config.base_jetty_server.suppress_error_details.desc	\N	8	suppress_error_details	module_config.base_jetty_server.suppress_error_details	t	BOOLEAN	10
523	f	http_security	false	module_config.base_jetty_server.block_http_head.desc	\N	9	block_http_head	module_config.base_jetty_server.block_http_head	t	BOOLEAN	10
524	f	http_security	false	module_config.base_jetty_server.block_http_options.desc	\N	10	block_http_options	module_config.base_jetty_server.block_http_options	t	BOOLEAN	10
525	f	http_security	\N	module_config.base_jetty_server.custom_response_headers.desc	\N	11	custom_response_headers	module_config.base_jetty_server.custom_response_headers	t	STRING_MULTILINE	10
526	f	http_request_pool	5	module_config.base_jetty_server.threadpool_min.desc	\N	12	threadpool.min	module_config.base_jetty_server.threadpool_min	f	NON_NEGATIVE_INTEGER	10
528	f	http_request_pool	\N	module_config.base_jetty_server.threadpool.accept_queue_size.desc	\N	14	threadpool.accept_queue_size	module_config.base_jetty_server.threadpool.accept_queue_size	f	NON_NEGATIVE_INTEGER	10
529	f	http_request_pool	8	module_config.base_jetty_server.max_header_size.request.kb.desc	\N	15	max_header_size.request.kb	module_config.base_jetty_server.max_header_size.request.kb	f	POSITIVE_INTEGER	10
530	f	http_request_pool	8	module_config.base_jetty_server.max_header_size.response.kb.desc	\N	16	max_header_size.response.kb	module_config.base_jetty_server.max_header_size.response.kb	f	POSITIVE_INTEGER	10
531	f	http_request_pool	30000	module_config.base_jetty_server.read_idle_timeout.millis.desc	\N	17	read_idle_timeout.millis	module_config.base_jetty_server.read_idle_timeout.millis	f	POSITIVE_INTEGER	10
532	f	sessions	false	module_config.base_jetty_server.use_inmemory_sessions.desc	\N	18	sessions.inmemory	module_config.base_jetty_server.use_inmemory_sessions	f	BOOLEAN	10
533	f	sessions	30	module_config.base_jetty_server.session_timeout_mins.desc	\N	19	sessions.timeout.mins	module_config.base_jetty_server.session_timeout_mins	f	POSITIVE_INTEGER	10
534	f	sessions	60000	module_config.base_jetty_server.session_scavenger_interval_millis.desc	\N	20	sessions.scavenger.interval.millis	module_config.base_jetty_server.session_scavenger_interval_millis	f	POSITIVE_INTEGER	10
535	f	http_access_log	\N	module_config.base_jetty_server.access_log.appenders.desc	\N	21	access_log.appenders	module_config.base_jetty_server.access_log.appenders	f	STRING_MULTILINE	10
536	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_file.desc	\N	22	tls.keystore.file	module_config.base_server.tls_keystore_file	t	LOCAL_FILEPATH	10
537	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_password.desc	\N	23	tls.keystore.password	module_config.base_server.tls_keystore_password	t	PASSWORD	10
538	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_keyalias.desc	\N	24	tls.keystore.keyalias	module_config.base_server.tls_keystore_keyalias	t	STRING	10
539	f	tls_ssl_encryption	\N	module_config.base_server.tls_keystore_keypass.desc	\N	25	tls.keystore.keypass	module_config.base_server.tls_keystore_keypass	t	PASSWORD	10
540	f	tls_ssl_encryption	false	module_config.base_server.tls_enabled.desc	\N	26	tls.enabled	module_config.base_server.tls_enabled	f	BOOLEAN	10
541	f	tls_ssl_encryption	false	module_config.base_server.tls_clientauth_enabled.desc	\N	27	tls.clientauth.enabled	module_config.base_server.tls_clientauth_enabled	f	BOOLEAN	10
542	f	tls_ssl_encryption	\N	module_config.base_server.tls_truststore_file.desc	\N	28	tls.truststore.file	module_config.base_server.tls_truststore_file	t	LOCAL_FILEPATH	10
543	f	tls_ssl_encryption	\N	module_config.base_server.tls_truststore_password.desc	\N	29	tls.truststore.password	module_config.base_server.tls_truststore_password	t	PASSWORD	10
544	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.cipher_whitelist.desc	\N	30	tls.protocol.cipher_whitelist	module_config.base_server.tls.protocol.cipher_whitelist	t	STRING	10
545	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.cipher_blacklist.desc	\N	31	tls.protocol.cipher_blacklist	module_config.base_server.tls.protocol.cipher_blacklist	t	STRING	10
546	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.protocol_whitelist.desc	\N	32	tls.protocol.protocol_whitelist	module_config.base_server.tls.protocol.protocol_whitelist	t	STRING	10
547	f	tls_ssl_encryption	\N	module_config.base_server.tls.protocol.protocol_blacklist.desc	\N	33	tls.protocol.protocol_blacklist	module_config.base_server.tls.protocol.protocol_blacklist	t	STRING	10
548	f	cross_origin_resource_sharing_cors	false	module_config.base_jetty_server.cors_enable.desc	\N	34	cors.enable	module_config.base_jetty_server.cors_enable	f	BOOLEAN	10
549	f	cross_origin_resource_sharing_cors	*	module_config.base_jetty_server.cors_origins.desc	\N	35	cors.origins	module_config.base_jetty_server.cors_origins	f	STRING	10
550	f	cross_origin_resource_sharing_cors	\N	module_config.base_jetty_server.cors_allowed_headers.desc	\N	36	cors.allowed_headers	module_config.base_jetty_server.cors_allowed_headers	f	STRING	10
551	f	auth_general_for_apis	false	module_config.base_jetty_server.anonymous_access_enabled.desc	\N	37	anonymous.access.enabled	module_config.base_jetty_server.anonymous_access_enabled	f	BOOLEAN	10
552	f	auth_general_for_apis	ANONYMOUS	module_config.base_jetty_server.anonymous.access.account_username.desc	\N	38	anonymous.access.account_username	module_config.base_jetty_server.anonymous.access.account_username	f	STRING	10
553	f	auth_http_basic	false	module_config.base_jetty_server.security.http_basic.enabled.desc	\N	39	security.http.basic.enabled	module_config.base_jetty_server.security.http_basic.enabled	f	BOOLEAN	10
554	f	auth_http_basic	Smile CDR	module_config.base_jetty_server.security.http_basic.realm.desc	\N	40	security.http.basic.realm	module_config.base_jetty_server.security.http_basic.realm	f	STRING	10
555	f	auth_openid_connect	false	module_config.base_jetty_server.security.oic.enabled.desc	\N	41	security.oic.enabled	module_config.base_jetty_server.security.oic.enabled	f	BOOLEAN	10
556	f	trusted_client	false	module_config.base_jetty_server.trusted_client.enabled.desc	\N	42	trusted_client.enabled	module_config.base_jetty_server.trusted_client.enabled	f	BOOLEAN	10
557	f	trusted_client	false	module_config.base_jetty_server.trusted_client.assert_permissions.desc	\N	43	trusted_client.assert_permissions	module_config.base_jetty_server.trusted_client.assert_permissions	f	BOOLEAN	10
558	f	http_security	\N	module_config.base_jetty_server.frame_options.allow_from.desc	\N	44	frame_options.allow_from	module_config.base_jetty_server.frame_options.allow_from	t	STRING	10
\.


--
-- Data for Name: cdr_module_prot_dep; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_module_prot_dep (pid, description_key, entry_key, prototype_pid) FROM stdin;
1	module_config.base.requires.PERSISTENCE_ALL.forSecurityModule	PERSISTENCE_ALL	2
2	module_config.base.requires.SECURITY_IN_SAML	SECURITY_IN_SAML	3
3	module_config.base.requires.SECURITY_IN_UP	SECURITY_IN_UP	3
4	module_config.base.requires.SECURITY_IN_UP	SECURITY_IN_UP	4
5	module_config.base.requires.SECURITY_IN_OIC	SECURITY_IN_OIC	4
6	module_config.base.requires.SECURITY_IN_ANONYMOUS	SECURITY_IN_ANONYMOUS	4
7	module_config.base.requires.VALIDATION_SUPPORT	VALIDATION_SUPPORT	5
8	module_config.base.requires.PERSISTENCE_ALL	PERSISTENCE_ALL	6
9	module_config.base.requires.PERSISTENCE_R4	PERSISTENCE_R4	7
10	module_config.base.requires.ENDPOINT_SUBSCRIPTION_WEBSOCKET	ENDPOINT_SUBSCRIPTION_WEBSOCKET	7
11	module_config.base.requires.VALIDATION_SUPPORT	VALIDATION_SUPPORT	7
12	module_config.base.requires.SECURITY_IN_UP	SECURITY_IN_UP	7
13	module_config.base.requires.SECURITY_IN_OIC	SECURITY_IN_OIC	7
14	module_config.base.requires.SECURITY_IN_ANONYMOUS	SECURITY_IN_ANONYMOUS	7
15	module_config.base.requires.SECURITY_IN_SAML	SECURITY_IN_SAML	8
16	module_config.base.requires.SECURITY_IN_UP	SECURITY_IN_UP	8
17	module_config.base.requires.ENDPOINT_FHIR	ENDPOINT_FHIR	8
18	module_config.base.requires.SECURITY_IN_ANONYMOUS	SECURITY_IN_ANONYMOUS	8
19	module_config.base.requires.SECURITY_IN_UP	SECURITY_IN_UP	9
20	module_config.base.requires.SECURITY_USER_SELF_REGISTRATION	SECURITY_USER_SELF_REGISTRATION	9
21	module_config.package_registry.requires.PACKAGE_CACHE	PACKAGE_CACHE	10
22	module_config.base.requires.SECURITY_IN_UP	SECURITY_IN_UP	10
23	module_config.base.requires.SECURITY_IN_OIC	SECURITY_IN_OIC	10
24	module_config.base.requires.SECURITY_IN_ANONYMOUS	SECURITY_IN_ANONYMOUS	10
\.


--
-- Data for Name: cdr_module_prot_supplies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_module_prot_supplies (pid, entry_key, prototype_pid) FROM stdin;
1	0	1
2	21	1
3	5	2
4	6	2
5	13	2
6	19	2
7	21	2
8	21	3
9	21	4
10	9	5
11	18	5
12	3	5
13	16	5
14	21	5
15	14	6
16	21	6
17	7	7
18	20	7
19	21	7
20	21	8
21	4	9
22	21	9
23	21	10
\.


--
-- Data for Name: cdr_module_prototype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_module_prototype (pid, module_type, stoppable) FROM stdin;
1	CLUSTER_MGR	f
2	SECURITY_IN_LOCAL	t
3	ADMIN_WEB	t
4	ADMIN_JSON	t
5	PERSISTENCE_R4	t
6	SUBSCRIPTION_MATCHER	t
7	ENDPOINT_FHIR_REST_R4	t
8	ENDPOINT_FHIRWEB	t
9	SECURITY_OUT_SMART	t
10	ENDPOINT_PACKAGE_REGISTRY	t
\.


--
-- Data for Name: cdr_module_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_module_state (pid, state_type, state_val, module_pid) FROM stdin;
\.


--
-- Data for Name: cdr_node; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_node (pid, is_deleted, node_id) FROM stdin;
1	\N	Master
\.


--
-- Data for Name: cdr_node_process; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_node_process (pid, created_time, heartbeat_time, killed_by, node_pid, process_id, process_name, started_time, node_status, stopped_time, opt_lock) FROM stdin;
1	2022-03-17 00:14:28.92	2022-03-17 00:25:38.932	\N	1	Algonquin	1@ac41ce06ba65	2022-03-17 00:14:28.92	2	\N	0
\.


--
-- Data for Name: cdr_oa2_cli_det_auth_grnt_typ; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oa2_cli_det_auth_grnt_typ (pid, grant_type, client_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oa2_cli_det_autoap_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oa2_cli_det_autoap_scope (pid, scope, client_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oa2_cli_det_autogrnt_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oa2_cli_det_autogrnt_scope (pid, scope, client_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oa2_cli_det_clisec; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oa2_cli_det_clisec (pid, sec_activation, sec_creation, sec_desc, sec_expiration, cli_secret, client_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oa2_cli_det_reg_redir_uri; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oa2_cli_det_reg_redir_uri (pid, redir_uri, client_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oa2_server; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oa2_server (pid, auth_well_known_config_url, custom_token_params, federation_auth_script_text, federation_auth_url, federation_jwks_url, federation_reg_id, federation_req_scopes, federation_token_url, federation_user_info_url, federation_user_mapping_text, fhir_endpoint_url, iss, server_name, notes, organization_id, response_type, intrspct_client_id, intrspct_client_scrt, jwks_file, jwks_text, module_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oauth2_atoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oauth2_atoken (pid, expiration, grant_type, id_token_bytes, id_token_val, issued, redirect_uri, token_hash, token_bytes, token_val, client_pid, module_pid, refresh_token_pid, user_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oauth2_atoken_adnlinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oauth2_atoken_adnlinfo (pid, info_key, info_value, token_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oauth2_atoken_grntda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oauth2_atoken_grntda (pid, perm_arg, perm_name, token_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oauth2_atoken_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oauth2_atoken_scope (pid, scope, token_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oauth2_auth_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oauth2_auth_code (pid, oauth2_authentication, client_id, code_val, expiration, pkce_challenge, pkce_challenge_type, state_val) FROM stdin;
\.


--
-- Data for Name: cdr_oauth2_client_det_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oauth2_client_det_scope (pid, scope, client_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oauth2_client_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oauth2_client_details (pid, access_token_validity_seconds, always_require_approval, attestation_accepted, can_introspect_any, can_introspect_own, can_reuse_tokens, client_id, client_name, client_secret, enabled, fixed_scope, public_jwks, refresh_token_validity_seconds, remember_approved_scopes, secret_client_can_change, secret_required, module_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oauth2_client_perm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oauth2_client_perm (pid, permission_type, permission_arg, client_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oauth2_jwt_uniq_id; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oauth2_jwt_uniq_id (jwt_id, consumed_timestamp) FROM stdin;
\.


--
-- Data for Name: cdr_oauth2_refresh_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oauth2_refresh_token (pid, expiration, issued, token_val, client_pid, user_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oauth2_rtoken_adnlinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oauth2_rtoken_adnlinfo (pid, info_key, info_value, token_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oauth2_rtoken_grntda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oauth2_rtoken_grntda (pid, perm_arg, perm_name, token_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oauth2_rtoken_lnchresid; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oauth2_rtoken_lnchresid (pid, resource_id, resource_type, token_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oauth2_rtoken_reqprm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oauth2_rtoken_reqprm (pid, parm_key, parm_value, token_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oauth2_rtoken_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oauth2_rtoken_scope (pid, scope, token_pid) FROM stdin;
\.


--
-- Data for Name: cdr_oauth2_rtoken_udata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_oauth2_rtoken_udata (token_pid, token_key, val) FROM stdin;
\.


--
-- Data for Name: cdr_user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_user_details (pid, is_anon_acct, creds_expire_on, user_disabled, email, expires_on, is_external, failed_login_attempts, family_name, given_name, last_active, user_locked, module_pid, notes, user_password, is_service_acct, is_system_user, updated_ts, username, username_has_namespace) FROM stdin;
1	\N	\N	f	\N	\N	\N	0	GenericUser	Admin	\N	f	2	\N	BCRYPT_12_ROUND|Y|$2a$12$qIX8iNecs4RLbKLZHFIzR.4I5n8LLcWHrj9ESpEk2xmf04EyFVCWK	f	f	2022-03-17 00:14:33.255	ADMIN	\N
2	\N	\N	f	\N	\N	\N	0	Anonymous	Anonymous	\N	f	2	\N	BCRYPT_12_ROUND|Y|$2a$12$vsUxo3GNLMKbuPFdIL9HRekaSPIRIdCSHc55/h5NMa0A43fhIFc/e	f	t	2022-03-17 00:14:33.683	ANONYMOUS	\N
\.


--
-- Data for Name: cdr_user_details_def_lnch_ctx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_user_details_def_lnch_ctx (pid, context_type, resource_id, user_pid) FROM stdin;
\.


--
-- Data for Name: cdr_user_details_oa2clnaprvscp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_user_details_oa2clnaprvscp (pid, is_approved, scope, client_pid, user_pid) FROM stdin;
\.


--
-- Data for Name: cdr_user_oa2cln_tos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_user_oa2cln_tos (pid, created_by, created_date, revoked_by, revoked_date, version, client_pid, user_pid) FROM stdin;
\.


--
-- Data for Name: cdr_user_perm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_user_perm (pid, permission_type, permission_arg, user_pid) FROM stdin;
1	ROLE_SUPERUSER	\N	1
2	ROLE_ANONYMOUS	\N	2
\.


--
-- Data for Name: cdr_user_tfa_key; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_user_tfa_key (pid, confirmed_at, key_expires, failed_verifs, a_key, a_style, optlock, user_pid) FROM stdin;
\.


--
-- Data for Name: cdr_xact_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_xact_log (pid, initial_timestamp, evt_outcome, src_xact_id, evt_subtype, src_guid, evt_type, user_pid, client_pid, cdr_endpoint_module_pid) FROM stdin;
\.


--
-- Data for Name: cdr_xact_log_step; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cdr_xact_log_step (step_pid, body_bytes, body_type, local_host, local_port, evt_outcome, processing_time, remote_host, remote_port, request_url_str, req_val_result, request_verb, response_status, subscription_id, log_timestamp, step_type, log_pid) FROM stdin;
\.


--
-- Data for Name: qrtz_blob_triggers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qrtz_blob_triggers (sched_name, trigger_name, trigger_group, blob_data) FROM stdin;
\.


--
-- Data for Name: qrtz_calendars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qrtz_calendars (sched_name, calendar_name, calendar) FROM stdin;
\.


--
-- Data for Name: qrtz_cron_triggers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) FROM stdin;
\.


--
-- Data for Name: qrtz_fired_triggers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qrtz_fired_triggers (sched_name, entry_id, trigger_name, trigger_group, instance_name, fired_time, sched_time, priority, state, job_name, job_group, is_nonconcurrent, requests_recovery) FROM stdin;
cdr-scheduler-Master-clustermgr	876352f3-5a78-47d0-b29b-4f950264a5751647476068348	ca.cdr.clustermgr.svc.impl.ClusterStatusSvcImpl$ClusterHeartbeatJob	clustermgr	876352f3-5a78-47d0-b29b-4f950264a575	1647476730959	1647476758933	5	ACQUIRED	\N	\N	f	f
\.


--
-- Data for Name: qrtz_job_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) FROM stdin;
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.ClusterStatusSvcImpl$ClusterHeartbeatJob	clustermgr	\N	ca.cdr.clustermgr.svc.impl.ClusterStatusSvcImpl$ClusterHeartbeatJob	f	t	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.UserPersistenceSvcImpl	clustermgr	\N	ca.cdr.clustermgr.svc.impl.UserPersistenceSvcImpl$Job	f	t	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.OAuth2PersistenceSvcImpl	clustermgr	\N	ca.cdr.clustermgr.svc.impl.OAuth2PersistenceSvcImpl$Job	f	t	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.DatabaseBackedHttpSessionStorageSvcImpl	clustermgr	\N	ca.cdr.clustermgr.svc.impl.DatabaseBackedHttpSessionStorageSvcImpl$Job	f	t	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.StatsHeartbeatSvcImpl$PersistModuleLevelMetricsJob	clustermgr	\N	ca.cdr.clustermgr.svc.impl.StatsHeartbeatSvcImpl$PersistModuleLevelMetricsJob	f	t	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.StatsCleanupSvcImpl$CollapseJob	clustermgr	\N	ca.cdr.clustermgr.svc.impl.StatsCleanupSvcImpl$CollapseJob	f	t	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.StatsCleanupSvcImpl$PurgeJob	clustermgr	\N	ca.cdr.clustermgr.svc.impl.StatsCleanupSvcImpl$PurgeJob	f	t	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.TransactionLogCleanupSvcImpl	clustermgr	\N	ca.cdr.clustermgr.svc.impl.TransactionLogCleanupSvcImpl$Job	f	t	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
\.


--
-- Data for Name: qrtz_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qrtz_locks (sched_name, lock_name) FROM stdin;
cdr-scheduler-Master-clustermgr	TRIGGER_ACCESS
cdr-scheduler-Master-clustermgr	STATE_ACCESS
\.


--
-- Data for Name: qrtz_paused_trigger_grps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qrtz_paused_trigger_grps (sched_name, trigger_group) FROM stdin;
\.


--
-- Data for Name: qrtz_scheduler_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qrtz_scheduler_state (sched_name, instance_name, last_checkin_time, checkin_interval) FROM stdin;
cdr-scheduler-Master-clustermgr	876352f3-5a78-47d0-b29b-4f950264a575	1647476739382	7500
\.


--
-- Data for Name: qrtz_simple_triggers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qrtz_simple_triggers (sched_name, trigger_name, trigger_group, repeat_count, repeat_interval, times_triggered) FROM stdin;
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.DatabaseBackedHttpSessionStorageSvcImpl	clustermgr	-1	60000	12
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.StatsHeartbeatSvcImpl$PersistModuleLevelMetricsJob	clustermgr	-1	60000	12
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.StatsCleanupSvcImpl$PurgeJob	clustermgr	-1	3600000	1
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.StatsCleanupSvcImpl$CollapseJob	clustermgr	-1	300000	3
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.TransactionLogCleanupSvcImpl	clustermgr	-1	600000	2
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.ClusterStatusSvcImpl$ClusterHeartbeatJob	clustermgr	-1	30000	23
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.UserPersistenceSvcImpl	clustermgr	-1	60000	12
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.OAuth2PersistenceSvcImpl	clustermgr	-1	60000	12
\.


--
-- Data for Name: qrtz_simprop_triggers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qrtz_simprop_triggers (sched_name, trigger_name, trigger_group, str_prop_1, str_prop_2, str_prop_3, int_prop_1, int_prop_2, long_prop_1, long_prop_2, dec_prop_1, dec_prop_2, bool_prop_1, bool_prop_2) FROM stdin;
\.


--
-- Data for Name: qrtz_triggers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) FROM stdin;
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.UserPersistenceSvcImpl	clustermgr	ca.cdr.clustermgr.svc.impl.UserPersistenceSvcImpl	clustermgr	\N	1647476789610	1647476729610	5	WAITING	SIMPLE	1647476069610	0	\N	0	\\x
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.OAuth2PersistenceSvcImpl	clustermgr	ca.cdr.clustermgr.svc.impl.OAuth2PersistenceSvcImpl	clustermgr	\N	1647476790432	1647476730432	5	WAITING	SIMPLE	1647476070432	0	\N	0	\\x
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.DatabaseBackedHttpSessionStorageSvcImpl	clustermgr	ca.cdr.clustermgr.svc.impl.DatabaseBackedHttpSessionStorageSvcImpl	clustermgr	\N	1647476790750	1647476730750	5	WAITING	SIMPLE	1647476070750	0	\N	0	\\x
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.StatsHeartbeatSvcImpl$PersistModuleLevelMetricsJob	clustermgr	ca.cdr.clustermgr.svc.impl.StatsHeartbeatSvcImpl$PersistModuleLevelMetricsJob	clustermgr	\N	1647476790914	1647476730914	5	WAITING	SIMPLE	1647476070914	0	\N	0	\\x
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.StatsCleanupSvcImpl$PurgeJob	clustermgr	ca.cdr.clustermgr.svc.impl.StatsCleanupSvcImpl$PurgeJob	clustermgr	\N	1647479671023	1647476071023	5	WAITING	SIMPLE	1647476071023	0	\N	0	\\x
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.TransactionLogCleanupSvcImpl	clustermgr	ca.cdr.clustermgr.svc.impl.TransactionLogCleanupSvcImpl	clustermgr	\N	1647477271109	1647476671109	5	WAITING	SIMPLE	1647476071109	0	\N	0	\\x
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.StatsCleanupSvcImpl$CollapseJob	clustermgr	ca.cdr.clustermgr.svc.impl.StatsCleanupSvcImpl$CollapseJob	clustermgr	\N	1647476971013	1647476671013	5	WAITING	SIMPLE	1647476071013	0	\N	0	\\x
cdr-scheduler-Master-clustermgr	ca.cdr.clustermgr.svc.impl.ClusterStatusSvcImpl$ClusterHeartbeatJob	clustermgr	ca.cdr.clustermgr.svc.impl.ClusterStatusSvcImpl$ClusterHeartbeatJob	clustermgr	\N	1647476758933	1647476728933	5	ACQUIRED	SIMPLE	1647476068933	0	\N	0	\\x
\.


--
-- Name: seq_ag_address_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_ag_address_pid', 1, false);


--
-- Name: seq_ag_appl_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_ag_appl_pid', 1, false);


--
-- Name: seq_ag_attestation_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_ag_attestation_pid', 1, false);


--
-- Name: seq_ag_class_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_ag_class_pid', 1, false);


--
-- Name: seq_ag_data_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_ag_data_pid', 1, false);


--
-- Name: seq_ag_document_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_ag_document_pid', 1, false);


--
-- Name: seq_ag_note_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_ag_note_pid', 1, false);


--
-- Name: seq_ag_oauth_redirect_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_ag_oauth_redirect_pid', 1, false);


--
-- Name: seq_ag_phone_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_ag_phone_pid', 1, false);


--
-- Name: seq_ag_profile_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_ag_profile_pid', 1, false);


--
-- Name: seq_ag_sandbox_client_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_ag_sandbox_client_pid', 1, false);


--
-- Name: seq_ag_scope_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_ag_scope_pid', 1, false);


--
-- Name: seq_ag_screenshot_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_ag_screenshot_pid', 1, false);


--
-- Name: seq_auditevt_header_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_auditevt_header_pid', 1, false);


--
-- Name: seq_auditevt_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_auditevt_pid', 1, false);


--
-- Name: seq_auditevt_targetmodule_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_auditevt_targetmodule_pid', 1, false);


--
-- Name: seq_auditevt_targetres_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_auditevt_targetres_pid', 1, false);


--
-- Name: seq_auditevt_targetuser_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_auditevt_targetuser_pid', 1, false);


--
-- Name: seq_auditevt_type_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_auditevt_type_pid', 1, false);


--
-- Name: seq_cdatemplate_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_cdatemplate_pid', 1, false);


--
-- Name: seq_cdatemplateparam_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_cdatemplateparam_pid', 1, false);


--
-- Name: seq_fhirsearchparam_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_fhirsearchparam_pid', 1, false);


--
-- Name: seq_httpsession_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_httpsession_pid', 1, false);


--
-- Name: seq_metrichc_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_metrichc_pid', 1, false);


--
-- Name: seq_metrichealth_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_metrichealth_pid', 51, true);


--
-- Name: seq_modproc_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_modproc_pid', 51, true);


--
-- Name: seq_modstat_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_modstat_pid', 1, false);


--
-- Name: seq_module_cfgprop_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_module_cfgprop_pid', 601, true);


--
-- Name: seq_module_dep_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_module_dep_pid', 51, true);


--
-- Name: seq_module_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_module_pid', 51, true);


--
-- Name: seq_module_prot_cfg_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_module_prot_cfg_pid', 601, true);


--
-- Name: seq_module_prot_dep_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_module_prot_dep_pid', 51, true);


--
-- Name: seq_module_prot_supplies_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_module_prot_supplies_pid', 51, true);


--
-- Name: seq_module_prototype_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_module_prototype_pid', 51, true);


--
-- Name: seq_node_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_node_pid', 51, true);


--
-- Name: seq_nodeproc_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_nodeproc_pid', 51, true);


--
-- Name: seq_oa2atokadnlinfo_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2atokadnlinfo_pid', 1, false);


--
-- Name: seq_oa2atoken_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2atoken_pid', 1, false);


--
-- Name: seq_oa2atokgrntda_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2atokgrntda_pid', 1, false);


--
-- Name: seq_oa2atokscp_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2atokscp_pid', 1, false);


--
-- Name: seq_oa2authcode_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2authcode_pid', 1, false);


--
-- Name: seq_oa2clidetaascop_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2clidetaascop_pid', 1, false);


--
-- Name: seq_oa2clidetagscop_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2clidetagscop_pid', 1, false);


--
-- Name: seq_oa2clidetauthgrnttyp_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2clidetauthgrnttyp_pid', 1, false);


--
-- Name: seq_oa2clidetclisec_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2clidetclisec_pid', 1, false);


--
-- Name: seq_oa2clidetregrediruri_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2clidetregrediruri_pid', 1, false);


--
-- Name: seq_oa2clientdetails_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2clientdetails_pid', 1, false);


--
-- Name: seq_oa2clientdetailsscope_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2clientdetailsscope_pid', 1, false);


--
-- Name: seq_oa2clientperm_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2clientperm_pid', 1, false);


--
-- Name: seq_oa2reftoken_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2reftoken_pid', 1, false);


--
-- Name: seq_oa2rtokadnlinfo_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2rtokadnlinfo_pid', 1, false);


--
-- Name: seq_oa2rtokgrntda_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2rtokgrntda_pid', 1, false);


--
-- Name: seq_oa2rtoklnchresid_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2rtoklnchresid_pid', 1, false);


--
-- Name: seq_oa2rtokreqprm_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2rtokreqprm_pid', 1, false);


--
-- Name: seq_oa2rtokscp_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2rtokscp_pid', 1, false);


--
-- Name: seq_oa2server_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_oa2server_pid', 1, false);


--
-- Name: seq_user_oa2cln_tos_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_user_oa2cln_tos_pid', 1, false);


--
-- Name: seq_user_perm_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_user_perm_pid', 51, true);


--
-- Name: seq_user_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_user_pid', 51, true);


--
-- Name: seq_userdeflnchctx_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_userdeflnchctx_pid', 1, false);


--
-- Name: seq_usertfakey_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_usertfakey_pid', 1, false);


--
-- Name: seq_usroa2clntaprvdscp_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_usroa2clntaprvdscp_pid', 1, false);


--
-- Name: seq_xact_log_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_xact_log_pid', 1, false);


--
-- Name: seq_xact_log_step_pid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_xact_log_step_pid', 1, false);


--
-- Name: FLY_CDR_MIGRATION FLY_CDR_MIGRATION_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FLY_CDR_MIGRATION"
    ADD CONSTRAINT "FLY_CDR_MIGRATION_pk" PRIMARY KEY (installed_rank);


--
-- Name: ag_address ag_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_address
    ADD CONSTRAINT ag_address_pkey PRIMARY KEY (pid);


--
-- Name: ag_appl ag_appl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_appl
    ADD CONSTRAINT ag_appl_pkey PRIMARY KEY (pid);


--
-- Name: ag_attestation ag_attestation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_attestation
    ADD CONSTRAINT ag_attestation_pkey PRIMARY KEY (pid);


--
-- Name: ag_class ag_class_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_class
    ADD CONSTRAINT ag_class_pkey PRIMARY KEY (pid);


--
-- Name: ag_data ag_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_data
    ADD CONSTRAINT ag_data_pkey PRIMARY KEY (pid);


--
-- Name: ag_document ag_document_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_document
    ADD CONSTRAINT ag_document_pkey PRIMARY KEY (pid);


--
-- Name: ag_note ag_note_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_note
    ADD CONSTRAINT ag_note_pkey PRIMARY KEY (pid);


--
-- Name: ag_oauth_redirect ag_oauth_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_oauth_redirect
    ADD CONSTRAINT ag_oauth_redirect_pkey PRIMARY KEY (pid);


--
-- Name: ag_phone ag_phone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_phone
    ADD CONSTRAINT ag_phone_pkey PRIMARY KEY (pid);


--
-- Name: ag_profile ag_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_profile
    ADD CONSTRAINT ag_profile_pkey PRIMARY KEY (pid);


--
-- Name: ag_sandbox_client ag_sandbox_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_sandbox_client
    ADD CONSTRAINT ag_sandbox_client_pkey PRIMARY KEY (pid);


--
-- Name: ag_scope ag_scope_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_scope
    ADD CONSTRAINT ag_scope_pkey PRIMARY KEY (pid);


--
-- Name: ag_screenshot ag_screenshot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_screenshot
    ADD CONSTRAINT ag_screenshot_pkey PRIMARY KEY (pid);


--
-- Name: cdr_audit_evt_header cdr_audit_evt_header_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt_header
    ADD CONSTRAINT cdr_audit_evt_header_pkey PRIMARY KEY (pid);


--
-- Name: cdr_audit_evt cdr_audit_evt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt
    ADD CONSTRAINT cdr_audit_evt_pkey PRIMARY KEY (pid);


--
-- Name: cdr_audit_evt_target_module cdr_audit_evt_target_module_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt_target_module
    ADD CONSTRAINT cdr_audit_evt_target_module_pkey PRIMARY KEY (pid);


--
-- Name: cdr_audit_evt_target_res cdr_audit_evt_target_res_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt_target_res
    ADD CONSTRAINT cdr_audit_evt_target_res_pkey PRIMARY KEY (pid);


--
-- Name: cdr_audit_evt_target_user cdr_audit_evt_target_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt_target_user
    ADD CONSTRAINT cdr_audit_evt_target_user_pkey PRIMARY KEY (pid);


--
-- Name: cdr_audit_evt_type cdr_audit_evt_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt_type
    ADD CONSTRAINT cdr_audit_evt_type_pkey PRIMARY KEY (pid);


--
-- Name: cdr_cda_template_param cdr_cda_template_param_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_cda_template_param
    ADD CONSTRAINT cdr_cda_template_param_pkey PRIMARY KEY (pid);


--
-- Name: cdr_cda_template cdr_cda_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_cda_template
    ADD CONSTRAINT cdr_cda_template_pkey PRIMARY KEY (pid);


--
-- Name: cdr_db_version cdr_db_version_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_db_version
    ADD CONSTRAINT cdr_db_version_pkey PRIMARY KEY (db_version);


--
-- Name: cdr_fhir_searchparam cdr_fhir_searchparam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_fhir_searchparam
    ADD CONSTRAINT cdr_fhir_searchparam_pkey PRIMARY KEY (pid);


--
-- Name: cdr_global_gauge cdr_global_gauge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_global_gauge
    ADD CONSTRAINT cdr_global_gauge_pkey PRIMARY KEY (id);


--
-- Name: cdr_http_session cdr_http_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_http_session
    ADD CONSTRAINT cdr_http_session_pkey PRIMARY KEY (pid);


--
-- Name: cdr_metric_gauge cdr_metric_gauge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_metric_gauge
    ADD CONSTRAINT cdr_metric_gauge_pkey PRIMARY KEY (gauge_type, intervl, modproc_pid, start_time);


--
-- Name: cdr_metric_hc cdr_metric_hc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_metric_hc
    ADD CONSTRAINT cdr_metric_hc_pkey PRIMARY KEY (pid);


--
-- Name: cdr_metric_health cdr_metric_health_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_metric_health
    ADD CONSTRAINT cdr_metric_health_pkey PRIMARY KEY (pid);


--
-- Name: cdr_metric_timer cdr_metric_timer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_metric_timer
    ADD CONSTRAINT cdr_metric_timer_pkey PRIMARY KEY (intervl, modproc_pid, start_time, timer_type);


--
-- Name: cdr_module_cfg_prop cdr_module_cfg_prop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_cfg_prop
    ADD CONSTRAINT cdr_module_cfg_prop_pkey PRIMARY KEY (pid);


--
-- Name: cdr_module_dep cdr_module_dep_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_dep
    ADD CONSTRAINT cdr_module_dep_pkey PRIMARY KEY (pid);


--
-- Name: cdr_module cdr_module_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module
    ADD CONSTRAINT cdr_module_pkey PRIMARY KEY (pid);


--
-- Name: cdr_module_process cdr_module_process_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_process
    ADD CONSTRAINT cdr_module_process_pkey PRIMARY KEY (pid);


--
-- Name: cdr_module_prot_cfg cdr_module_prot_cfg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_prot_cfg
    ADD CONSTRAINT cdr_module_prot_cfg_pkey PRIMARY KEY (pid);


--
-- Name: cdr_module_prot_dep cdr_module_prot_dep_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_prot_dep
    ADD CONSTRAINT cdr_module_prot_dep_pkey PRIMARY KEY (pid);


--
-- Name: cdr_module_prot_supplies cdr_module_prot_supplies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_prot_supplies
    ADD CONSTRAINT cdr_module_prot_supplies_pkey PRIMARY KEY (pid);


--
-- Name: cdr_module_prototype cdr_module_prototype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_prototype
    ADD CONSTRAINT cdr_module_prototype_pkey PRIMARY KEY (pid);


--
-- Name: cdr_module_state cdr_module_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_state
    ADD CONSTRAINT cdr_module_state_pkey PRIMARY KEY (pid);


--
-- Name: cdr_node cdr_node_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_node
    ADD CONSTRAINT cdr_node_pkey PRIMARY KEY (pid);


--
-- Name: cdr_node_process cdr_node_process_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_node_process
    ADD CONSTRAINT cdr_node_process_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oa2_cli_det_auth_grnt_typ cdr_oa2_cli_det_auth_grnt_typ_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_cli_det_auth_grnt_typ
    ADD CONSTRAINT cdr_oa2_cli_det_auth_grnt_typ_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oa2_cli_det_autoap_scope cdr_oa2_cli_det_autoap_scope_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_cli_det_autoap_scope
    ADD CONSTRAINT cdr_oa2_cli_det_autoap_scope_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oa2_cli_det_autogrnt_scope cdr_oa2_cli_det_autogrnt_scope_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_cli_det_autogrnt_scope
    ADD CONSTRAINT cdr_oa2_cli_det_autogrnt_scope_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oa2_cli_det_clisec cdr_oa2_cli_det_clisec_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_cli_det_clisec
    ADD CONSTRAINT cdr_oa2_cli_det_clisec_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oa2_cli_det_reg_redir_uri cdr_oa2_cli_det_reg_redir_uri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_cli_det_reg_redir_uri
    ADD CONSTRAINT cdr_oa2_cli_det_reg_redir_uri_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oa2_server cdr_oa2_server_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_server
    ADD CONSTRAINT cdr_oa2_server_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oauth2_atoken_adnlinfo cdr_oauth2_atoken_adnlinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_atoken_adnlinfo
    ADD CONSTRAINT cdr_oauth2_atoken_adnlinfo_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oauth2_atoken_grntda cdr_oauth2_atoken_grntda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_atoken_grntda
    ADD CONSTRAINT cdr_oauth2_atoken_grntda_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oauth2_atoken cdr_oauth2_atoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_atoken
    ADD CONSTRAINT cdr_oauth2_atoken_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oauth2_atoken_scope cdr_oauth2_atoken_scope_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_atoken_scope
    ADD CONSTRAINT cdr_oauth2_atoken_scope_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oauth2_auth_code cdr_oauth2_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_auth_code
    ADD CONSTRAINT cdr_oauth2_auth_code_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oauth2_client_det_scope cdr_oauth2_client_det_scope_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_client_det_scope
    ADD CONSTRAINT cdr_oauth2_client_det_scope_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oauth2_client_details cdr_oauth2_client_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_client_details
    ADD CONSTRAINT cdr_oauth2_client_details_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oauth2_client_perm cdr_oauth2_client_perm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_client_perm
    ADD CONSTRAINT cdr_oauth2_client_perm_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oauth2_jwt_uniq_id cdr_oauth2_jwt_uniq_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_jwt_uniq_id
    ADD CONSTRAINT cdr_oauth2_jwt_uniq_id_pkey PRIMARY KEY (jwt_id);


--
-- Name: cdr_oauth2_refresh_token cdr_oauth2_refresh_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_refresh_token
    ADD CONSTRAINT cdr_oauth2_refresh_token_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oauth2_rtoken_adnlinfo cdr_oauth2_rtoken_adnlinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_rtoken_adnlinfo
    ADD CONSTRAINT cdr_oauth2_rtoken_adnlinfo_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oauth2_rtoken_grntda cdr_oauth2_rtoken_grntda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_rtoken_grntda
    ADD CONSTRAINT cdr_oauth2_rtoken_grntda_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oauth2_rtoken_lnchresid cdr_oauth2_rtoken_lnchresid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_rtoken_lnchresid
    ADD CONSTRAINT cdr_oauth2_rtoken_lnchresid_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oauth2_rtoken_reqprm cdr_oauth2_rtoken_reqprm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_rtoken_reqprm
    ADD CONSTRAINT cdr_oauth2_rtoken_reqprm_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oauth2_rtoken_scope cdr_oauth2_rtoken_scope_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_rtoken_scope
    ADD CONSTRAINT cdr_oauth2_rtoken_scope_pkey PRIMARY KEY (pid);


--
-- Name: cdr_oauth2_rtoken_udata cdr_oauth2_rtoken_udata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_rtoken_udata
    ADD CONSTRAINT cdr_oauth2_rtoken_udata_pkey PRIMARY KEY (token_pid, token_key);


--
-- Name: cdr_user_details_def_lnch_ctx cdr_user_details_def_lnch_ctx_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_details_def_lnch_ctx
    ADD CONSTRAINT cdr_user_details_def_lnch_ctx_pkey PRIMARY KEY (pid);


--
-- Name: cdr_user_details_oa2clnaprvscp cdr_user_details_oa2clnaprvscp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_details_oa2clnaprvscp
    ADD CONSTRAINT cdr_user_details_oa2clnaprvscp_pkey PRIMARY KEY (pid);


--
-- Name: cdr_user_details cdr_user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_details
    ADD CONSTRAINT cdr_user_details_pkey PRIMARY KEY (pid);


--
-- Name: cdr_user_oa2cln_tos cdr_user_oa2cln_tos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_oa2cln_tos
    ADD CONSTRAINT cdr_user_oa2cln_tos_pkey PRIMARY KEY (pid);


--
-- Name: cdr_user_perm cdr_user_perm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_perm
    ADD CONSTRAINT cdr_user_perm_pkey PRIMARY KEY (pid);


--
-- Name: cdr_user_tfa_key cdr_user_tfa_key_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_tfa_key
    ADD CONSTRAINT cdr_user_tfa_key_pkey PRIMARY KEY (pid);


--
-- Name: cdr_xact_log cdr_xact_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_xact_log
    ADD CONSTRAINT cdr_xact_log_pkey PRIMARY KEY (pid);


--
-- Name: cdr_xact_log_step cdr_xact_log_step_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_xact_log_step
    ADD CONSTRAINT cdr_xact_log_step_pkey PRIMARY KEY (step_pid);


--
-- Name: ag_class idx_ag_classification_pid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_class
    ADD CONSTRAINT idx_ag_classification_pid UNIQUE (classification, pid);


--
-- Name: ag_oauth_redirect idx_ag_oauth_redirect_pid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_oauth_redirect
    ADD CONSTRAINT idx_ag_oauth_redirect_pid UNIQUE (oauth_redirect_url, pid);


--
-- Name: cdr_audit_evt_type idx_auditevttype_system_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt_type
    ADD CONSTRAINT idx_auditevttype_system_code UNIQUE (system_url, codeval);


--
-- Name: cdr_cda_template idx_cdatempl_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_cda_template
    ADD CONSTRAINT idx_cdatempl_id UNIQUE (template_id);


--
-- Name: cdr_module_cfg_prop idx_cdr_module_cdr_prop_modkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_cfg_prop
    ADD CONSTRAINT idx_cdr_module_cdr_prop_modkey UNIQUE (module_pid, prototype_pid);


--
-- Name: cdr_module_prot_cfg idx_cdr_module_prot_cdg_modkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_prot_cfg
    ADD CONSTRAINT idx_cdr_module_prot_cdg_modkey UNIQUE (prototype_pid, cfg_key);


--
-- Name: cdr_xact_log idx_guid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_xact_log
    ADD CONSTRAINT idx_guid UNIQUE (src_guid);


--
-- Name: cdr_http_session idx_httpsession_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_http_session
    ADD CONSTRAINT idx_httpsession_id UNIQUE (ses_id);


--
-- Name: cdr_metric_health idx_metrichc_mod_type_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_metric_health
    ADD CONSTRAINT idx_metrichc_mod_type_name UNIQUE (modproc_pid, healthcheck_type, custom_healthcheck_name);


--
-- Name: cdr_metric_hc idx_metrichc_nodep_hid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_metric_hc
    ADD CONSTRAINT idx_metrichc_nodep_hid UNIQUE (modproc_pid, healthcheck_type);


--
-- Name: cdr_module_process idx_modproc_nodeproc_mod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_process
    ADD CONSTRAINT idx_modproc_nodeproc_mod UNIQUE (nodeproc_pid, module_pid);


--
-- Name: cdr_module_state idx_modstat_modtype; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_state
    ADD CONSTRAINT idx_modstat_modtype UNIQUE (module_pid, state_type);


--
-- Name: cdr_module idx_module_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module
    ADD CONSTRAINT idx_module_id UNIQUE (node_pid, module_id);


--
-- Name: cdr_module_prot_dep idx_moduleprotdep_prot_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_prot_dep
    ADD CONSTRAINT idx_moduleprotdep_prot_key UNIQUE (prototype_pid, entry_key);


--
-- Name: cdr_module_prototype idx_moduleprototype_type; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_prototype
    ADD CONSTRAINT idx_moduleprototype_type UNIQUE (module_type);


--
-- Name: cdr_node idx_node_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_node
    ADD CONSTRAINT idx_node_id UNIQUE (node_id);


--
-- Name: cdr_node_process idx_nodeproc_procid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_node_process
    ADD CONSTRAINT idx_nodeproc_procid UNIQUE (process_id);


--
-- Name: cdr_oauth2_atoken_adnlinfo idx_oa2atokadlnf_atoken_adnlnf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_atoken_adnlinfo
    ADD CONSTRAINT idx_oa2atokadlnf_atoken_adnlnf UNIQUE (token_pid, info_key);


--
-- Name: cdr_oauth2_atoken_scope idx_oa2atokscp_atoken_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_atoken_scope
    ADD CONSTRAINT idx_oa2atokscp_atoken_scope UNIQUE (token_pid, scope);


--
-- Name: cdr_oauth2_auth_code idx_oa2authcode_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_auth_code
    ADD CONSTRAINT idx_oa2authcode_code UNIQUE (code_val);


--
-- Name: cdr_oa2_cli_det_autoap_scope idx_oa2clidetaascope_tok_scop; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_cli_det_autoap_scope
    ADD CONSTRAINT idx_oa2clidetaascope_tok_scop UNIQUE (client_pid, scope);


--
-- Name: cdr_oa2_cli_det_autogrnt_scope idx_oa2clidetagscope_tok_scop; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_cli_det_autogrnt_scope
    ADD CONSTRAINT idx_oa2clidetagscope_tok_scop UNIQUE (client_pid, scope);


--
-- Name: cdr_oa2_cli_det_clisec idx_oa2clidetclisec_secret; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_cli_det_clisec
    ADD CONSTRAINT idx_oa2clidetclisec_secret UNIQUE (client_pid, cli_secret);


--
-- Name: cdr_oa2_cli_det_reg_redir_uri idx_oa2clidetrruri_tok_sco; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_cli_det_reg_redir_uri
    ADD CONSTRAINT idx_oa2clidetrruri_tok_sco UNIQUE (client_pid, redir_uri);


--
-- Name: cdr_oauth2_client_det_scope idx_oa2clidetscop_token_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_client_det_scope
    ADD CONSTRAINT idx_oa2clidetscop_token_scope UNIQUE (client_pid, scope);


--
-- Name: cdr_oauth2_client_details idx_oa2clientdetails_cli_mod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_client_details
    ADD CONSTRAINT idx_oa2clientdetails_cli_mod UNIQUE (module_pid, client_id);


--
-- Name: cdr_oauth2_refresh_token idx_oa2reftoken_token; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_refresh_token
    ADD CONSTRAINT idx_oa2reftoken_token UNIQUE (token_val);


--
-- Name: cdr_oauth2_rtoken_adnlinfo idx_oa2rtokadlnf_rtoken_adnlnf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_rtoken_adnlinfo
    ADD CONSTRAINT idx_oa2rtokadlnf_rtoken_adnlnf UNIQUE (token_pid, info_key);


--
-- Name: cdr_oauth2_rtoken_reqprm idx_oa2rtokreqprm_rtoken_parm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_rtoken_reqprm
    ADD CONSTRAINT idx_oa2rtokreqprm_rtoken_parm UNIQUE (token_pid, parm_key);


--
-- Name: cdr_oauth2_rtoken_scope idx_oa2rtokscp_rtoken_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_rtoken_scope
    ADD CONSTRAINT idx_oa2rtokscp_rtoken_scope UNIQUE (token_pid, scope);


--
-- Name: cdr_oa2_server idx_oa2server_fed_reg_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_server
    ADD CONSTRAINT idx_oa2server_fed_reg_id UNIQUE (module_pid, federation_reg_id);


--
-- Name: cdr_oa2_server idx_oa2server_module_issurl; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_server
    ADD CONSTRAINT idx_oa2server_module_issurl UNIQUE (module_pid, iss);


--
-- Name: cdr_oa2_cli_det_auth_grnt_typ idx_oa2tokgrttyp_tok_grnt_typ; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_cli_det_auth_grnt_typ
    ADD CONSTRAINT idx_oa2tokgrttyp_tok_grnt_typ UNIQUE (client_pid, grant_type);


--
-- Name: cdr_user_details_def_lnch_ctx idx_userdeflnchctx_user_ctyp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_details_def_lnch_ctx
    ADD CONSTRAINT idx_userdeflnchctx_user_ctyp UNIQUE (user_pid, context_type);


--
-- Name: cdr_user_details idx_userdet_module_username; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_details
    ADD CONSTRAINT idx_userdet_module_username UNIQUE (module_pid, username);


--
-- Name: cdr_user_tfa_key idx_usertfakey_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_tfa_key
    ADD CONSTRAINT idx_usertfakey_user UNIQUE (user_pid);


--
-- Name: qrtz_blob_triggers qrtz_blob_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_calendars qrtz_calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_calendars
    ADD CONSTRAINT qrtz_calendars_pkey PRIMARY KEY (sched_name, calendar_name);


--
-- Name: qrtz_cron_triggers qrtz_cron_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_fired_triggers qrtz_fired_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_fired_triggers
    ADD CONSTRAINT qrtz_fired_triggers_pkey PRIMARY KEY (sched_name, entry_id);


--
-- Name: qrtz_job_details qrtz_job_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_job_details
    ADD CONSTRAINT qrtz_job_details_pkey PRIMARY KEY (sched_name, job_name, job_group);


--
-- Name: qrtz_locks qrtz_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_locks
    ADD CONSTRAINT qrtz_locks_pkey PRIMARY KEY (sched_name, lock_name);


--
-- Name: qrtz_paused_trigger_grps qrtz_paused_trigger_grps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_paused_trigger_grps
    ADD CONSTRAINT qrtz_paused_trigger_grps_pkey PRIMARY KEY (sched_name, trigger_group);


--
-- Name: qrtz_scheduler_state qrtz_scheduler_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_scheduler_state
    ADD CONSTRAINT qrtz_scheduler_state_pkey PRIMARY KEY (sched_name, instance_name);


--
-- Name: qrtz_simple_triggers qrtz_simple_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers qrtz_simprop_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers qrtz_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: FLY_CDR_MIGRATION_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FLY_CDR_MIGRATION_s_idx" ON public."FLY_CDR_MIGRATION" USING btree (success);


--
-- Name: idx_ag_appl_identifier; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ag_appl_identifier ON public.ag_appl USING btree (identifier);


--
-- Name: idx_ag_attest_archive_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ag_attest_archive_date ON public.ag_attestation USING btree (archive_date);


--
-- Name: idx_auditevt_header_evt; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auditevt_header_evt ON public.cdr_audit_evt_header USING btree (event_pid);


--
-- Name: idx_auditevt_targmod_evt; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auditevt_targmod_evt ON public.cdr_audit_evt_target_module USING btree (event_pid);


--
-- Name: idx_auditevt_targres_evt; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auditevt_targres_evt ON public.cdr_audit_evt_target_res USING btree (event_pid);


--
-- Name: idx_auditevt_targusr_evt; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auditevt_targusr_evt ON public.cdr_audit_evt_target_user USING btree (event_pid);


--
-- Name: idx_cdr_template_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cdr_template_id ON public.cdr_cda_template USING btree (template_id);


--
-- Name: idx_fhirsp_base; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fhirsp_base ON public.cdr_fhir_searchparam USING btree (module_pid, sp_base);


--
-- Name: idx_fhirsp_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fhirsp_code ON public.cdr_fhir_searchparam USING btree (module_pid, sp_code);


--
-- Name: idx_fhirsp_lastupdated; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fhirsp_lastupdated ON public.cdr_fhir_searchparam USING btree (module_pid, last_updated);


--
-- Name: idx_fhirsp_lastused; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fhirsp_lastused ON public.cdr_fhir_searchparam USING btree (module_pid, last_used);


--
-- Name: idx_fhirsp_overallcount; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fhirsp_overallcount ON public.cdr_fhir_searchparam USING btree (module_pid, stat_overall_count);


--
-- Name: idx_fhirsp_resspread; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fhirsp_resspread ON public.cdr_fhir_searchparam USING btree (module_pid, stat_resource_spread);


--
-- Name: idx_fhirsp_sp_res_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fhirsp_sp_res_id ON public.cdr_fhir_searchparam USING btree (module_pid, sp_res_id);


--
-- Name: idx_fhirsp_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fhirsp_type ON public.cdr_fhir_searchparam USING btree (module_pid, sp_type);


--
-- Name: idx_fhirsp_valspread; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fhirsp_valspread ON public.cdr_fhir_searchparam USING btree (module_pid, stat_value_spread);


--
-- Name: idx_gauge_modcollintstart; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_gauge_modcollintstart ON public.cdr_metric_gauge USING btree (modproc_pid, gauge_type, intervl, start_time);


--
-- Name: idx_gauge_modcollstart; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_gauge_modcollstart ON public.cdr_metric_gauge USING btree (modproc_pid, is_collapsed, start_time);


--
-- Name: idx_httpsession_expiry; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_httpsession_expiry ON public.cdr_http_session USING btree (ses_expiry);


--
-- Name: idx_httpsession_module; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_httpsession_module ON public.cdr_http_session USING btree (module_pid);


--
-- Name: idx_modstat_mod; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_modstat_mod ON public.cdr_module_state USING btree (module_pid);


--
-- Name: idx_oa2atoken_expiration; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_oa2atoken_expiration ON public.cdr_oauth2_atoken USING btree (expiration);


--
-- Name: idx_oa2atoken_token_hash; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_oa2atoken_token_hash ON public.cdr_oauth2_atoken USING btree (token_hash);


--
-- Name: idx_oa2atoken_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_oa2atoken_user ON public.cdr_oauth2_atoken USING btree (user_pid);


--
-- Name: idx_oa2authcode_expiration; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_oa2authcode_expiration ON public.cdr_oauth2_auth_code USING btree (expiration);


--
-- Name: idx_oa2jwtuniqid_timestamp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_oa2jwtuniqid_timestamp ON public.cdr_oauth2_jwt_uniq_id USING btree (consumed_timestamp);


--
-- Name: idx_oa2reftoken_expiration; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_oa2reftoken_expiration ON public.cdr_oauth2_refresh_token USING btree (expiration);


--
-- Name: idx_oa2reftoken_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_oa2reftoken_user ON public.cdr_oauth2_refresh_token USING btree (user_pid);


--
-- Name: idx_qrtz_ft_inst_job_req_rcvry; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_ft_inst_job_req_rcvry ON public.qrtz_fired_triggers USING btree (sched_name, instance_name, requests_recovery);


--
-- Name: idx_qrtz_ft_j_g; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_ft_j_g ON public.qrtz_fired_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_ft_jg; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_ft_jg ON public.qrtz_fired_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_ft_t_g; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_ft_t_g ON public.qrtz_fired_triggers USING btree (sched_name, trigger_name, trigger_group);


--
-- Name: idx_qrtz_ft_tg; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_ft_tg ON public.qrtz_fired_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_ft_trig_inst_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_ft_trig_inst_name ON public.qrtz_fired_triggers USING btree (sched_name, instance_name);


--
-- Name: idx_qrtz_j_grp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_j_grp ON public.qrtz_job_details USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_j_req_recovery; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_j_req_recovery ON public.qrtz_job_details USING btree (sched_name, requests_recovery);


--
-- Name: idx_qrtz_t_c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_c ON public.qrtz_triggers USING btree (sched_name, calendar_name);


--
-- Name: idx_qrtz_t_g; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_g ON public.qrtz_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_t_j; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_j ON public.qrtz_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_t_jg; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_jg ON public.qrtz_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_t_n_g_state; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_n_g_state ON public.qrtz_triggers USING btree (sched_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_n_state; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_n_state ON public.qrtz_triggers USING btree (sched_name, trigger_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_next_fire_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_next_fire_time ON public.qrtz_triggers USING btree (sched_name, next_fire_time);


--
-- Name: idx_qrtz_t_nft_misfire; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_nft_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_nft_st ON public.qrtz_triggers USING btree (sched_name, trigger_state, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st_misfire; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_nft_st_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_state);


--
-- Name: idx_qrtz_t_nft_st_misfire_grp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_nft_st_misfire_grp ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_state; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_state ON public.qrtz_triggers USING btree (sched_name, trigger_state);


--
-- Name: idx_timer_modcollintstart; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_timer_modcollintstart ON public.cdr_metric_timer USING btree (modproc_pid, timer_type, intervl, start_time);


--
-- Name: idx_timer_modcollstart; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_timer_modcollstart ON public.cdr_metric_timer USING btree (modproc_pid, is_collapsed, start_time);


--
-- Name: idx_user_familyname; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_familyname ON public.cdr_user_details USING btree (module_pid, family_name);


--
-- Name: idx_user_givenname; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_givenname ON public.cdr_user_details USING btree (module_pid, given_name);


--
-- Name: idx_user_oa2cln_tos_usrclnt; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_oa2cln_tos_usrclnt ON public.cdr_user_oa2cln_tos USING btree (user_pid, client_pid);


--
-- Name: idx_userdeflnchctx_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_userdeflnchctx_user ON public.cdr_user_details_def_lnch_ctx USING btree (user_pid);


--
-- Name: idx_usroa2clntaprvdscp_clntusr; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usroa2clntaprvdscp_clntusr ON public.cdr_user_details_oa2clnaprvscp USING btree (client_pid, user_pid);


--
-- Name: idx_xactlog_initts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_xactlog_initts ON public.cdr_xact_log USING btree (initial_timestamp);


--
-- Name: idx_xactlogstep_logid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_xactlogstep_logid ON public.cdr_xact_log_step USING btree (log_pid);


--
-- Name: ag_address fk_ag_address_ag_profile; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_address
    ADD CONSTRAINT fk_ag_address_ag_profile FOREIGN KEY (ag_profile_pid) REFERENCES public.ag_profile(pid);


--
-- Name: ag_appl fk_ag_appl_ag_attestation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_appl
    ADD CONSTRAINT fk_ag_appl_ag_attestation FOREIGN KEY (attestation_pid) REFERENCES public.ag_attestation(pid);


--
-- Name: ag_appl fk_ag_appl_ag_profile; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_appl
    ADD CONSTRAINT fk_ag_appl_ag_profile FOREIGN KEY (profile_pid) REFERENCES public.ag_profile(pid);


--
-- Name: ag_appl fk_ag_appl_icon; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_appl
    ADD CONSTRAINT fk_ag_appl_icon FOREIGN KEY (icon_pid) REFERENCES public.ag_data(pid);


--
-- Name: ag_appl fk_ag_appl_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_appl
    ADD CONSTRAINT fk_ag_appl_module FOREIGN KEY (module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: ag_appl fk_ag_appl_oauth2_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_appl
    ADD CONSTRAINT fk_ag_appl_oauth2_client FOREIGN KEY (oauth2_client_pid) REFERENCES public.cdr_oauth2_client_details(pid);


--
-- Name: ag_appl fk_ag_appl_parent_pid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_appl
    ADD CONSTRAINT fk_ag_appl_parent_pid FOREIGN KEY (parent_pid) REFERENCES public.ag_appl(pid);


--
-- Name: ag_appl fk_ag_appl_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_appl
    ADD CONSTRAINT fk_ag_appl_user FOREIGN KEY (user_pid) REFERENCES public.cdr_user_details(pid);


--
-- Name: ag_attestation fk_ag_attestation_html; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_attestation
    ADD CONSTRAINT fk_ag_attestation_html FOREIGN KEY (html_pid) REFERENCES public.ag_data(pid);


--
-- Name: ag_attestation fk_ag_attestation_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_attestation
    ADD CONSTRAINT fk_ag_attestation_module FOREIGN KEY (module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: ag_attestation fk_ag_attestation_plain_html; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_attestation
    ADD CONSTRAINT fk_ag_attestation_plain_html FOREIGN KEY (plain_html_pid) REFERENCES public.ag_data(pid);


--
-- Name: ag_class fk_ag_class_ag_appl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_class
    ADD CONSTRAINT fk_ag_class_ag_appl FOREIGN KEY (ag_appl_pid) REFERENCES public.ag_appl(pid);


--
-- Name: ag_sandbox_client fk_ag_client_oauth2_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_sandbox_client
    ADD CONSTRAINT fk_ag_client_oauth2_client FOREIGN KEY (oauth2_client_pid) REFERENCES public.cdr_oauth2_client_details(pid);


--
-- Name: ag_document fk_ag_document_ag_appl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_document
    ADD CONSTRAINT fk_ag_document_ag_appl FOREIGN KEY (ag_appl_pid) REFERENCES public.ag_appl(pid);


--
-- Name: ag_document fk_ag_document_data_blob; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_document
    ADD CONSTRAINT fk_ag_document_data_blob FOREIGN KEY (document_pid) REFERENCES public.ag_data(pid);


--
-- Name: ag_note fk_ag_note_ag_appl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_note
    ADD CONSTRAINT fk_ag_note_ag_appl FOREIGN KEY (ag_appl_pid) REFERENCES public.ag_appl(pid);


--
-- Name: ag_oauth_redirect fk_ag_oauth_redirect_ag_appl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_oauth_redirect
    ADD CONSTRAINT fk_ag_oauth_redirect_ag_appl FOREIGN KEY (ag_appl_pid) REFERENCES public.ag_appl(pid);


--
-- Name: ag_phone fk_ag_phone_ag_profile; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_phone
    ADD CONSTRAINT fk_ag_phone_ag_profile FOREIGN KEY (ag_profile_pid) REFERENCES public.ag_profile(pid);


--
-- Name: ag_profile fk_ag_profile_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_profile
    ADD CONSTRAINT fk_ag_profile_module FOREIGN KEY (module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: ag_profile fk_ag_profile_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_profile
    ADD CONSTRAINT fk_ag_profile_user FOREIGN KEY (user_pid) REFERENCES public.cdr_user_details(pid);


--
-- Name: ag_sandbox_client fk_ag_sandbox_client_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_sandbox_client
    ADD CONSTRAINT fk_ag_sandbox_client_module FOREIGN KEY (module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: ag_sandbox_client fk_ag_sandbox_client_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_sandbox_client
    ADD CONSTRAINT fk_ag_sandbox_client_user FOREIGN KEY (user_pid) REFERENCES public.cdr_user_details(pid);


--
-- Name: ag_scope fk_ag_scope_ag_appl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_scope
    ADD CONSTRAINT fk_ag_scope_ag_appl FOREIGN KEY (ag_appl_pid) REFERENCES public.ag_appl(pid);


--
-- Name: ag_screenshot fk_ag_screenshot_ag_appl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_screenshot
    ADD CONSTRAINT fk_ag_screenshot_ag_appl FOREIGN KEY (ag_appl_pid) REFERENCES public.ag_appl(pid);


--
-- Name: ag_screenshot fk_ag_screenshot_data_blob; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ag_screenshot
    ADD CONSTRAINT fk_ag_screenshot_data_blob FOREIGN KEY (screenshot_pid) REFERENCES public.ag_data(pid);


--
-- Name: cdr_audit_evt fk_auditevt_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt
    ADD CONSTRAINT fk_auditevt_client FOREIGN KEY (client_pid) REFERENCES public.cdr_oauth2_client_details(pid);


--
-- Name: cdr_audit_evt fk_auditevt_endpointmodule; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt
    ADD CONSTRAINT fk_auditevt_endpointmodule FOREIGN KEY (endpoint_module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: cdr_audit_evt_header fk_auditevt_header_evt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt_header
    ADD CONSTRAINT fk_auditevt_header_evt FOREIGN KEY (event_pid) REFERENCES public.cdr_audit_evt(pid);


--
-- Name: cdr_audit_evt_target_module fk_auditevt_targetmod_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt_target_module
    ADD CONSTRAINT fk_auditevt_targetmod_module FOREIGN KEY (module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: cdr_audit_evt_target_module fk_auditevt_targetmodule_evt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt_target_module
    ADD CONSTRAINT fk_auditevt_targetmodule_evt FOREIGN KEY (event_pid) REFERENCES public.cdr_audit_evt(pid);


--
-- Name: cdr_audit_evt_target_res fk_auditevt_targetres_evt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt_target_res
    ADD CONSTRAINT fk_auditevt_targetres_evt FOREIGN KEY (event_pid) REFERENCES public.cdr_audit_evt(pid);


--
-- Name: cdr_audit_evt_target_res fk_auditevt_targetres_persmod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt_target_res
    ADD CONSTRAINT fk_auditevt_targetres_persmod FOREIGN KEY (pers_module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: cdr_audit_evt_target_user fk_auditevt_targetuser_evt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt_target_user
    ADD CONSTRAINT fk_auditevt_targetuser_evt FOREIGN KEY (event_pid) REFERENCES public.cdr_audit_evt(pid);


--
-- Name: cdr_audit_evt_target_user fk_auditevt_targetuser_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt_target_user
    ADD CONSTRAINT fk_auditevt_targetuser_user FOREIGN KEY (user_pid) REFERENCES public.cdr_user_details(pid);


--
-- Name: cdr_audit_evt fk_auditevt_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt
    ADD CONSTRAINT fk_auditevt_type FOREIGN KEY (type_pid) REFERENCES public.cdr_audit_evt_type(pid);


--
-- Name: cdr_audit_evt fk_auditevt_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_audit_evt
    ADD CONSTRAINT fk_auditevt_user FOREIGN KEY (user_pid) REFERENCES public.cdr_user_details(pid);


--
-- Name: cdr_cda_template fk_cda_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_cda_template
    ADD CONSTRAINT fk_cda_module FOREIGN KEY (module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: cdr_cda_template_param fk_cdatemplate_pid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_cda_template_param
    ADD CONSTRAINT fk_cdatemplate_pid FOREIGN KEY (template_pid) REFERENCES public.cdr_cda_template(pid);


--
-- Name: cdr_module_prot_cfg fk_cdr_moduleprotcfg_prot; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_prot_cfg
    ADD CONSTRAINT fk_cdr_moduleprotcfg_prot FOREIGN KEY (prototype_pid) REFERENCES public.cdr_module_prototype(pid);


--
-- Name: cdr_fhir_searchparam fk_fhirsearchparam_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_fhir_searchparam
    ADD CONSTRAINT fk_fhirsearchparam_module FOREIGN KEY (module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: cdr_metric_hc fk_hc_modp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_metric_hc
    ADD CONSTRAINT fk_hc_modp FOREIGN KEY (modproc_pid) REFERENCES public.cdr_module_process(pid);


--
-- Name: cdr_metric_health fk_health_modp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_metric_health
    ADD CONSTRAINT fk_health_modp FOREIGN KEY (modproc_pid) REFERENCES public.cdr_module_process(pid);


--
-- Name: cdr_http_session fk_httpsession_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_http_session
    ADD CONSTRAINT fk_httpsession_module FOREIGN KEY (module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: cdr_metric_gauge fk_metgauge_modp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_metric_gauge
    ADD CONSTRAINT fk_metgauge_modp FOREIGN KEY (modproc_pid) REFERENCES public.cdr_module_process(pid);


--
-- Name: cdr_metric_timer fk_mettimer_modp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_metric_timer
    ADD CONSTRAINT fk_mettimer_modp FOREIGN KEY (modproc_pid) REFERENCES public.cdr_module_process(pid);


--
-- Name: cdr_module_process fk_modproc_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_process
    ADD CONSTRAINT fk_modproc_module FOREIGN KEY (module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: cdr_module_process fk_modproc_nodeproc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_process
    ADD CONSTRAINT fk_modproc_nodeproc FOREIGN KEY (nodeproc_pid) REFERENCES public.cdr_node_process(pid);


--
-- Name: cdr_module_state fk_modstat_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_state
    ADD CONSTRAINT fk_modstat_module FOREIGN KEY (module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: cdr_module fk_module_node; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module
    ADD CONSTRAINT fk_module_node FOREIGN KEY (node_pid) REFERENCES public.cdr_node(pid);


--
-- Name: cdr_module_prot_dep fk_module_prot_dep_prot; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_prot_dep
    ADD CONSTRAINT fk_module_prot_dep_prot FOREIGN KEY (prototype_pid) REFERENCES public.cdr_module_prototype(pid);


--
-- Name: cdr_module_prot_supplies fk_module_prot_supplies_prot; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_prot_supplies
    ADD CONSTRAINT fk_module_prot_supplies_prot FOREIGN KEY (prototype_pid) REFERENCES public.cdr_module_prototype(pid);


--
-- Name: cdr_module fk_module_prototype; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module
    ADD CONSTRAINT fk_module_prototype FOREIGN KEY (prototype_pid) REFERENCES public.cdr_module_prototype(pid);


--
-- Name: cdr_module_cfg_prop fk_modulecfgprop_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_cfg_prop
    ADD CONSTRAINT fk_modulecfgprop_module FOREIGN KEY (module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: cdr_module_cfg_prop fk_modulecfgprop_prototype; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_cfg_prop
    ADD CONSTRAINT fk_modulecfgprop_prototype FOREIGN KEY (prototype_pid) REFERENCES public.cdr_module_prot_cfg(pid);


--
-- Name: cdr_module_dep fk_moduledep_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_dep
    ADD CONSTRAINT fk_moduledep_module FOREIGN KEY (module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: cdr_module_dep fk_moduledep_prototype; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_dep
    ADD CONSTRAINT fk_moduledep_prototype FOREIGN KEY (prototype_pid) REFERENCES public.cdr_module_prot_dep(pid);


--
-- Name: cdr_module_dep fk_moduledep_target; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_module_dep
    ADD CONSTRAINT fk_moduledep_target FOREIGN KEY (target_pid) REFERENCES public.cdr_module(pid);


--
-- Name: cdr_node_process fk_nodeprocess_node; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_node_process
    ADD CONSTRAINT fk_nodeprocess_node FOREIGN KEY (node_pid) REFERENCES public.cdr_node(pid);


--
-- Name: cdr_oauth2_atoken_adnlinfo fk_oa2atokadnlinfo_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_atoken_adnlinfo
    ADD CONSTRAINT fk_oa2atokadnlinfo_token FOREIGN KEY (token_pid) REFERENCES public.cdr_oauth2_atoken(pid);


--
-- Name: cdr_oauth2_atoken fk_oa2atoken_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_atoken
    ADD CONSTRAINT fk_oa2atoken_client FOREIGN KEY (client_pid) REFERENCES public.cdr_oauth2_client_details(pid);


--
-- Name: cdr_oauth2_atoken fk_oa2atoken_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_atoken
    ADD CONSTRAINT fk_oa2atoken_module FOREIGN KEY (module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: cdr_oauth2_atoken fk_oa2atoken_ref_tok; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_atoken
    ADD CONSTRAINT fk_oa2atoken_ref_tok FOREIGN KEY (refresh_token_pid) REFERENCES public.cdr_oauth2_refresh_token(pid);


--
-- Name: cdr_oauth2_atoken fk_oa2atoken_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_atoken
    ADD CONSTRAINT fk_oa2atoken_user FOREIGN KEY (user_pid) REFERENCES public.cdr_user_details(pid);


--
-- Name: cdr_oauth2_atoken_grntda fk_oa2atokgrntda_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_atoken_grntda
    ADD CONSTRAINT fk_oa2atokgrntda_token FOREIGN KEY (token_pid) REFERENCES public.cdr_oauth2_atoken(pid);


--
-- Name: cdr_oauth2_atoken_scope fk_oa2atokscp_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_atoken_scope
    ADD CONSTRAINT fk_oa2atokscp_token FOREIGN KEY (token_pid) REFERENCES public.cdr_oauth2_atoken(pid);


--
-- Name: cdr_oa2_cli_det_auth_grnt_typ fk_oa2clidetauthgrntty_cli; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_cli_det_auth_grnt_typ
    ADD CONSTRAINT fk_oa2clidetauthgrntty_cli FOREIGN KEY (client_pid) REFERENCES public.cdr_oauth2_client_details(pid);


--
-- Name: cdr_oa2_cli_det_autoap_scope fk_oa2clidetautoappscop_cli; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_cli_det_autoap_scope
    ADD CONSTRAINT fk_oa2clidetautoappscop_cli FOREIGN KEY (client_pid) REFERENCES public.cdr_oauth2_client_details(pid);


--
-- Name: cdr_oa2_cli_det_autogrnt_scope fk_oa2clidetautogrntpscop_cli; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_cli_det_autogrnt_scope
    ADD CONSTRAINT fk_oa2clidetautogrntpscop_cli FOREIGN KEY (client_pid) REFERENCES public.cdr_oauth2_client_details(pid);


--
-- Name: cdr_oa2_cli_det_clisec fk_oa2clidetclisec_cli; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_cli_det_clisec
    ADD CONSTRAINT fk_oa2clidetclisec_cli FOREIGN KEY (client_pid) REFERENCES public.cdr_oauth2_client_details(pid);


--
-- Name: cdr_oa2_cli_det_reg_redir_uri fk_oa2clidetregreduri_cli; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_cli_det_reg_redir_uri
    ADD CONSTRAINT fk_oa2clidetregreduri_cli FOREIGN KEY (client_pid) REFERENCES public.cdr_oauth2_client_details(pid);


--
-- Name: cdr_oauth2_client_det_scope fk_oa2clidetscop_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_client_det_scope
    ADD CONSTRAINT fk_oa2clidetscop_client FOREIGN KEY (client_pid) REFERENCES public.cdr_oauth2_client_details(pid);


--
-- Name: cdr_oauth2_client_details fk_oa2clientdetails_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_client_details
    ADD CONSTRAINT fk_oa2clientdetails_module FOREIGN KEY (module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: cdr_oauth2_client_perm fk_oa2clientperm_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_client_perm
    ADD CONSTRAINT fk_oa2clientperm_client FOREIGN KEY (client_pid) REFERENCES public.cdr_oauth2_client_details(pid);


--
-- Name: cdr_oauth2_refresh_token fk_oa2reftoken_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_refresh_token
    ADD CONSTRAINT fk_oa2reftoken_client FOREIGN KEY (client_pid) REFERENCES public.cdr_oauth2_client_details(pid);


--
-- Name: cdr_oauth2_refresh_token fk_oa2reftoken_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_refresh_token
    ADD CONSTRAINT fk_oa2reftoken_user FOREIGN KEY (user_pid) REFERENCES public.cdr_user_details(pid);


--
-- Name: cdr_oauth2_rtoken_adnlinfo fk_oa2rtokadnlinfo_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_rtoken_adnlinfo
    ADD CONSTRAINT fk_oa2rtokadnlinfo_token FOREIGN KEY (token_pid) REFERENCES public.cdr_oauth2_refresh_token(pid);


--
-- Name: cdr_oauth2_rtoken_grntda fk_oa2rtokgrntda_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_rtoken_grntda
    ADD CONSTRAINT fk_oa2rtokgrntda_token FOREIGN KEY (token_pid) REFERENCES public.cdr_oauth2_refresh_token(pid);


--
-- Name: cdr_oauth2_rtoken_lnchresid fk_oa2rtoklnchresid_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_rtoken_lnchresid
    ADD CONSTRAINT fk_oa2rtoklnchresid_token FOREIGN KEY (token_pid) REFERENCES public.cdr_oauth2_refresh_token(pid);


--
-- Name: cdr_oauth2_rtoken_reqprm fk_oa2rtokreqprm_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_rtoken_reqprm
    ADD CONSTRAINT fk_oa2rtokreqprm_token FOREIGN KEY (token_pid) REFERENCES public.cdr_oauth2_refresh_token(pid);


--
-- Name: cdr_oauth2_rtoken_scope fk_oa2rtokscp_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_rtoken_scope
    ADD CONSTRAINT fk_oa2rtokscp_token FOREIGN KEY (token_pid) REFERENCES public.cdr_oauth2_refresh_token(pid);


--
-- Name: cdr_oauth2_rtoken_udata fk_oa2rtokud_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oauth2_rtoken_udata
    ADD CONSTRAINT fk_oa2rtokud_token FOREIGN KEY (token_pid) REFERENCES public.cdr_oauth2_refresh_token(pid);


--
-- Name: cdr_oa2_server fk_oa2server_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_oa2_server
    ADD CONSTRAINT fk_oa2server_module FOREIGN KEY (module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: cdr_xact_log fk_transit_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_xact_log
    ADD CONSTRAINT fk_transit_client FOREIGN KEY (client_pid) REFERENCES public.cdr_oauth2_client_details(pid);


--
-- Name: cdr_xact_log fk_transit_event; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_xact_log
    ADD CONSTRAINT fk_transit_event FOREIGN KEY (user_pid) REFERENCES public.cdr_user_details(pid);


--
-- Name: cdr_user_oa2cln_tos fk_user_oa2cln_tos_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_oa2cln_tos
    ADD CONSTRAINT fk_user_oa2cln_tos_client FOREIGN KEY (client_pid) REFERENCES public.cdr_oauth2_client_details(pid);


--
-- Name: cdr_user_oa2cln_tos fk_user_oa2cln_tos_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_oa2cln_tos
    ADD CONSTRAINT fk_user_oa2cln_tos_user FOREIGN KEY (user_pid) REFERENCES public.cdr_user_details(pid);


--
-- Name: cdr_user_details_def_lnch_ctx fk_userdeflnchctx_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_details_def_lnch_ctx
    ADD CONSTRAINT fk_userdeflnchctx_user FOREIGN KEY (user_pid) REFERENCES public.cdr_user_details(pid);


--
-- Name: cdr_user_details fk_userdetails_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_details
    ADD CONSTRAINT fk_userdetails_module FOREIGN KEY (module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: cdr_user_perm fk_userperm_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_perm
    ADD CONSTRAINT fk_userperm_user FOREIGN KEY (user_pid) REFERENCES public.cdr_user_details(pid);


--
-- Name: cdr_user_tfa_key fk_usertfakey_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_tfa_key
    ADD CONSTRAINT fk_usertfakey_user FOREIGN KEY (user_pid) REFERENCES public.cdr_user_details(pid);


--
-- Name: cdr_user_details_oa2clnaprvscp fk_usroa2clntaprvdscp_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_details_oa2clnaprvscp
    ADD CONSTRAINT fk_usroa2clntaprvdscp_client FOREIGN KEY (client_pid) REFERENCES public.cdr_oauth2_client_details(pid);


--
-- Name: cdr_user_details_oa2clnaprvscp fk_usroa2clntaprvdscp_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_user_details_oa2clnaprvscp
    ADD CONSTRAINT fk_usroa2clntaprvdscp_user FOREIGN KEY (user_pid) REFERENCES public.cdr_user_details(pid);


--
-- Name: cdr_xact_log fk_xactlogstep_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_xact_log
    ADD CONSTRAINT fk_xactlogstep_module FOREIGN KEY (cdr_endpoint_module_pid) REFERENCES public.cdr_module(pid);


--
-- Name: cdr_xact_log_step fk_xactlogstep_xactlog; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cdr_xact_log_step
    ADD CONSTRAINT fk_xactlogstep_xactlog FOREIGN KEY (log_pid) REFERENCES public.cdr_xact_log(pid);


--
-- Name: qrtz_blob_triggers qrtz_blob_triggers_sched_name_trigger_name_trigger_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_sched_name_trigger_name_trigger_group_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_cron_triggers qrtz_cron_triggers_sched_name_trigger_name_trigger_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_sched_name_trigger_name_trigger_group_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simple_triggers qrtz_simple_triggers_sched_name_trigger_name_trigger_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_sched_name_trigger_name_trigger_group_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers qrtz_simprop_triggers_sched_name_trigger_name_trigger_grou_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_sched_name_trigger_name_trigger_grou_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers qrtz_triggers_sched_name_job_name_job_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_sched_name_job_name_job_group_fkey FOREIGN KEY (sched_name, job_name, job_group) REFERENCES public.qrtz_job_details(sched_name, job_name, job_group);


--
-- PostgreSQL database dump complete
--

