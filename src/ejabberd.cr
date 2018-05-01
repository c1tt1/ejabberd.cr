require "http/client"
require "json"

# TODO: Write documentation for `Ejabberd`
class Ejabberd
  def initialize(@api_url : String)
  end

  def add_rosteritem(local_user : String, local_server : String, user : String, server : String,
                     nick : String, group : String, subs : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "localuser", local_user
        json.field "localserver", local_server
        json.field "user", user
        json.field "server", server
        json.field "nick", nick
        json.field "group", group
        json.field "subs", subs
      end
    end

    request("add_rosteritem", body)
  end

  def backup(file : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("backup", body)
  end

  def ban_account(user : String, host : String, reason : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "reason", reason
      end
    end

    request("ban_account", body)
  end

  def change_password(user : String, host : String, new_pass : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "newpass", new_pass
      end
    end

    request("change_password", body)
  end

  def change_room_option(name : String, service : String, option : String, value : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "service", service
        json.field "option", option
        json.field "value", value
      end
    end

    request("change_room_option", body)
  end

  def check_account(user : String, host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
      end
    end

    request("check_account", body)
  end

  def check_password(user : String, host : String, password : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "password", password
      end
    end

    request("check_password", body)
  end

  def check_password_hash(user : String, host : String, password_hash : String, hash_method : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "passwordhash", password_hash
        json.field "hashmethod", hash_method
      end
    end

    request("check_password_hash", body)
  end

  def clear_cache : HTTP::Client::Response
    request("clear_cache", "{}")
  end

  def compile(file : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("compile", body)
  end

  def connected_users : HTTP::Client::Response
    request("connected_users", "{}")
  end

  def connected_users_info : HTTP::Client::Response
    request("connected_users_info", "{}")
  end

  def connected_users_number : HTTP::Client::Response
    request("connected_users_number", "{}")
  end

  def connected_users_vhost(host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "host", host
      end
    end

    request("connected_users_vhost", body)
  end

  def convert_to_scram(host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "host", host
      end
    end

    request("convert_to_scram", body)
  end

  def convert_to_yaml(in_ : String, out_ : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "in", in_
        json.field "out", out_
      end
    end

    request("convert_to_yaml", body)
  end

  def create_room(name : String, service : String, host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "service", service
        json.field "host", host
      end
    end

    request("create_room", body)
  end

  def create_room_with_opts(name : String, service : String, host : String, option : Hash(String, String)) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "service", service
        json.field "host", host
        json.field "option" do
          json.array do
            json.object do
              option.each do |key, value|
                json.field key, value
              end
            end
          end
        end
      end
    end

    request("create_room_with_opts", body)
  end

  def create_rooms_file(file : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("create_rooms_file", body)
  end

  def delete_expired_messages : HTTP::Client::Response
    request("delete_expired_messages", "{}")
  end

  def delete_mnesia(host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "host", host
      end
    end

    request("delete_mnesia", body)
  end

  def delete_old_messages(days : UInt16) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "days", days
      end
    end

    request("delete_old_messages", body)
  end

  def delete_old_users(days : UInt16) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "days", days
      end
    end

    request("delete_old_users", body)
  end

  def delete_old_users_vhost(host : String, days : UInt16) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "host", host
        json.field "days", days
      end
    end

    request("delete_old_users_vhost", body)
  end

  def delete_rosteritem(localuser : String, localserver : String, user : String, server : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "localuser", localuser
        json.field "localserver", localserver
        json.field "user", user
        json.field "server", server
      end
    end

    request("delete_rosteritem", body)
  end

  def destroy_room(name : String, service : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "service", service
      end
    end

    request("destroy_room", body)
  end

  def destroy_rooms_file(file : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("destroy_rooms_file", body)
  end

  def dump(file : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("dump", body)
  end

  def dump_table(file : String, table : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "file", file
        json.field "table", table
      end
    end

    request("dump_table", body)
  end

  def export2sql(host : String, file : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "host", host
        json.field "file", file
      end
    end

    request("export2sql", body)
  end

  def export_piefxis(dir : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "dir", dir
      end
    end

    request("export_piefxis", body)
  end

  def export_piefxis_host(dir : String, host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "dir", dir
        json.field "host", host
      end
    end

    request("export_piefxis_host", body)
  end

  def gen_html_doc_for_commands(dir : String, regexp : String, examples : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "file", file
        json.field "regexp", regexp
        json.field "examples", examples
      end
    end

    request("gen_html_doc_for_commands", body)
  end

  def gen_markdown_doc_for_commands(file : String, regexp : String, examples : String)
    body = JSON.build do |json|
      json.object do
        json.field "file", file
        json.field "regexp", regexp
        json.field "examples", examples
      end
    end

    request("gen_markdown_doc_for_commands", body)
  end

  def get_certificates(domains : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "domains", domains
      end
    end

    request("get_certificates", body)
  end

  def get_cookie : HTTP::Client::Response
    request("get_cookie", "{}")
  end

  def get_last(user : String, host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
      end
    end

    request("get_last", body)
  end

  def get_loglevel : HTTP::Client::Response
    request("get_loglevel", "{}")
  end

  def get_offline_count(user : String, server : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "server", server
      end
    end

    request("get_offline_count", body)
  end

  def get_presence(user : String, server : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "server", server
      end
    end

    request("get_presence", body)
  end

  def get_presence(user : String, server : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "server", server
      end
    end

    request("get_presence", body)
  end

  def get_room_affiliations(name : String, service : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "service", service
      end
    end

    request("get_room_affiliations", body)
  end

  def get_room_occupants(name : String, service : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "service", service
      end
    end

    request("get_room_occupants", body)
  end

  def get_room_occupants_number(name : String, service : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "service", service
      end
    end

    request("get_room_occupants_number", body)
  end

  def get_room_options(name : String, service : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "service", service
      end
    end

    request("get_room_options", body)
  end

  def get_roster(name : String, service : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "service", service
      end
    end

    request("get_roster", body)
  end

  def get_subscribers(name : String, service : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "service", service
      end
    end

    request("get_subscribers", body)
  end

  def get_user_rooms(name : String, service : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "service", service
      end
    end

    request("get_user_rooms", body)
  end

  def get_vcard(user : String, host : String, name : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "name", name
      end
    end

    request("get_vcard", body)
  end

  def get_vcard2(user : String, host : String, name : String, sub_name : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "name", name
        json.field "subname", sub_name
      end
    end

    request("get_vcard2", body)
  end

  def get_vcard2_multi(user : String, host : String, name : String, sub_name : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "name", name
        json.field "subname", sub_name
      end
    end

    request("get_vcard2_multi", body)
  end

  def import_dir(file : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("import_dir", body)
  end

  def import_file(file : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("import_file", body)
  end

  def import_piefxis(file : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("import_piefxis", body)
  end

  def import_prosody(dir : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "dir", dir
      end
    end

    request("import_prosody", body)
  end

  def incoming_s2s_number : HTTP::Client::Response
    request("incoming_s2s_number", "{}")
  end

  def install_fallback(file : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("install_fallback", body)
  end

  def join_cluster(node : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "node", node
      end
    end

    request("join_cluster", body)
  end

  def kick_session(user : String, host : String, resource : String, reason : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "resource", resource
        json.field "reason", reason
      end
    end

    request("kick_session", body)
  end

  def kick_user(user : String, host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
      end
    end

    request("kick_user", body)
  end

  def leave_cluster(node : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "node", node
      end
    end

    request("leave_cluster", body)
  end

  def list_certificates(option : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "option", option
      end
    end

    request("list_certificates", body)
  end

  def list_cluster(node : String) : HTTP::Client::Response
    request("list_cluster", "{}")
  end

  def load(file : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("load", body)
  end

  def mnesia_change_nodename(old_node_name : String, new_node_name : String, old_backup : String, new_backup : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "oldnodename", old_node_name
        json.field "newnodename", new_node_name
        json.field "oldbackup", old_backup
        json.field "newbackup", new_backup
      end
    end

    request("mnesia_change_nodename", body)
  end

  def module_check(mod : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "module", mod
      end
    end

    request("module_check", body)
  end

  def module_install(mod : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "module", mod
      end
    end

    request("module_install", body)
  end

  def module_uninstall(mod : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "module", mod
      end
    end

    request("module_uninstall", body)
  end

  def module_upgrade(mod : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "module", mod
      end
    end

    request("module_upgrade", body)
  end

  def modules_available : HTTP::Client::Response
    request("modules_available", "{}")
  end

  def modules_installed : HTTP::Client::Response
    request("modules_installed", "{}")
  end

  def modules_update_specs : HTTP::Client::Response
    request("modules_update_specs", "{}")
  end

  def muc_online_rooms(host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "host", host
      end
    end

    request("muc_online_rooms", body)
  end

  def muc_online_rooms_by_regex(host : String, regex : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "host", host
        json.field "regex", regex
      end
    end

    request("muc_online_rooms", body)
  end

  def muc_register_nick(nick : String, jid : String, serverhost : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "nick", nick
        json.field "jid", jid
        json.field "serverhost", serverhost
      end
    end

    request("muc_register_nick", body)
  end

  def muc_unregister_nick(jid : String, serverhost : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "jid", jid
        json.field "serverhost", serverhost
      end
    end

    request("muc_unregister_nick", body)
  end

  def num_active_users(host : String, days : UInt16) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "host", host
        json.field "days", days
      end
    end

    request("num_active_users", body)
  end

  def num_resources(user : String, host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
      end
    end

    request("num_resources", body)
  end

  def oauth_issue_token(jid : String, ttl : UInt16, scopes : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "jid", jid
        json.field "ttl", ttl
        json.field "scopes", scopes
      end
    end

    request("oauth_issue_token", body)
  end

  def oauth_list_tokens : HTTP::Client::Response
    request("oauth_list_tokens", "{}")
  end

  def oauth_revoke_token(token : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "token", token
      end
    end

    request("oauth_revoke_token", body)
  end

  def outgoing_s2s_number : HTTP::Client::Response
    request("outgoing_s2s_number", "{}")
  end

  def privacy_set(user : String, host : String, xmlquery : String? = nil, element : String? = nil) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        if xmlquery
          json.field "xmlquery", xmlquery
        end

        if element
          json.field "element", element
        end
      end
    end

    request("privacy_set", body)
  end

  def privacy_get(user : String, host : String, element : String, ns : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "element", element
        json.field "ns", ns
      end
    end

    request("privacy_get", body)
  end

  def process_rosteritems(action : String, subs : String, asks : String, users : String, contacts : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "action", action
        json.field "subs", subs
        json.field "asks", asks
        json.field "users", users
        json.field "contacts", contacts
      end
    end

    request("process_rosteritems", body)
  end

  def push_alltoall(host : String, group : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "host", host
        json.field "group", group
      end
    end

    request("push_alltoall", body)
  end

  def push_roster(user : String, file : String, host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "file", file
        json.field "user", user
        json.field "host", host
      end
    end

    request("push_roster", body)
  end

  def push_roster_all(file : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("push_roster_all", body)
  end

  def register(user : String, host : String, password : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "password", password
      end
    end

    request("register", body)
  end

  def registered_users(host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "host", host
      end
    end

    request("registered_users", body)
  end

  def registered_vhosts : HTTP::Client::Response
    request("registered_vhosts", "{}")
  end

  def reload_config : HTTP::Client::Response
    request("reload_config", "{}")
  end

  def renew_certificates : HTTP::Client::Response
    request("renew_certificates", "{}")
  end

  def reopen_log : HTTP::Client::Response
    request("reopen_log", "{}")
  end

  def resource_num(user : String, host : String, num : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "num", num
      end
    end

    request("resource_num", body)
  end

  def restart : HTTP::Client::Response
    request("restart", "{}")
  end

  def restart_module(host : String, mod : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "host", host
        json.field "module", mod
      end
    end

    request("restart_module", body)
  end

  def restore(file : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("restore", body)
  end

  def revoke_certificate(domain_or_file : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "domain_or_file", domain_or_file
      end
    end

    request("revoke_certificate", body)
  end

  def rooms_unused_destroy(host : String, days : UInt16) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "host", host
        json.field "days", days
      end
    end

    request("rooms_unused_destroy", body)
  end

  def rooms_unused_list(host : String, days : UInt16) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "host", host
        json.field "days", days
      end
    end

    request("rooms_unused_list", body)
  end

  def rotate_log : HTTP::Client::Response
    request("rotate_log", "{}")
  end

  def send_direct_invitation(name : String, service : String, password : String, reason : String, users : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "service", service
        json.field "password", asks
        json.field "reason", reason
        json.field "users", users
      end
    end

    request("send_direct_invitation", body)
  end

  def send_message(type_ : String, from : String, to : String, subject : String, body_ : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "type", type_
        json.field "from", from
        json.field "to", to
        json.field "subject", subject
        json.field "body", body_
      end
    end

    request("send_message", body)
  end

  def send_stanza(from : String, to : String, stanza : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "from", from
        json.field "to", to
        json.field "stanza", stanza
      end
    end

    request("send_stanza", body)
  end

  def send_stanza_c2s(user : String, host : String, resource : String, stanza : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "resource", resource
        json.field "stanza", stanza
      end
    end

    request("send_stanza_c2s", body)
  end

  def set_last(user : String, host : String, time_stamp : UInt, status : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "timestamp", time_stamp
        json.field "status", status
      end
    end

    request("set_last", body)
  end

  def set_loglevel(log_level : UInt8) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "loglevel", log_level
      end
    end

    request("set_loglevel", body)
  end

  def set_master(node_name : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "nodename", node_name
      end
    end

    request("set_master", body)
  end

  def set_nickname(user : String, host : String, nick_name : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "nickname", nick_name
      end
    end

    request("send_stanza_c2s", body)
  end

  def set_presence(user : String, host : String, resource : String, type_ : String, show : String, status : String, priority : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "resource", resource
        json.field "type", type_
        json.field "show", show
        json.field "status", status
        json.field "priority", priority
      end
    end

    request("set_presence", body)
  end

  def set_room_affiliation(name : String, service : String, jid : String, affiliation : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "service", service
        json.field "jid", jid
        json.field "affiliation", affiliation
      end
    end

    request("set_room_affiliation", body)
  end

  def set_vcard(user : String, host : String, name : String, content : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "name", name
        json.field "content", content
      end
    end

    request("set_vcard", body)
  end

  def set_vcard2(user : String, host : String, name : String, sub_name : String, content : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "name", name
        json.field "subname", sub_name
        json.field "content", content
      end
    end

    request("set_vcard2", body)
  end

  def set_vcard2_multi(user : String, host : String, name : String, sub_name : String, contents : Array(String))
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "name", name
        json.field "subname", sub_name
        json.field "contents" do
          json.array do
            contents.each do |element|
              json.string element
            end
          end
        end
      end
    end

    request("set_vcard2_multi", body)
  end

  def srg_create(group : String, host : String, name : String, description : String, display : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "group", group
        json.field "host", host
        json.field "name", name
        json.field "description", description
        json.field "display", display
      end
    end

    request("srg_create", body)
  end

  def srg_delete(group : String, host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "group", group
        json.field "host", host
      end
    end

    request("srg_delete", body)
  end

  def srg_get_info(group : String, host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "group", group
        json.field "host", host
      end
    end

    request("srg_get_info", body)
  end

  def srg_get_members(group : String, host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "group", group
        json.field "host", host
      end
    end

    request("srg_get_members", body)
  end

  def srg_list(host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "host", host
      end
    end

    request("srg_list", body)
  end

  def srg_user_add(user : String, host : String, group : String, group_host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "group", group
        json.field "grouphost", group_host
      end
    end

    request("srg_user_add", body)
  end

  def srg_user_del(user : String, host : String, group : String, group_host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
        json.field "group", group
        json.field "grouphost", group_host
      end
    end

    request("srg_user_del", body)
  end

  def stats(name : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "name", name
      end
    end

    request("stats", body)
  end

  def stats_host(name : String, host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "host", host
      end
    end

    request("stats_host", body)
  end

  def status : HTTP::Client::Response
    request("status", "{}")
  end

  def status_list(status : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "status", status
      end
    end

    request("status_list", body)
  end

  def status_list_host(host : String, status : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "host", host
        json.field "status", status
      end
    end

    request("status_list_host", body)
  end

  def status_num(status : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "status", status
      end
    end

    request("status_num", body)
  end

  def status_num_host(host : String, status : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "host", host
        json.field "status", status
      end
    end

    request("status_num_host", body)
  end

  def stop : HTTP::Client::Response
    request("stop", "{}")
  end

  def stop_kindly(delay : UInt16, announcement : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "delay", delay
        json.field "announcement", announcement
      end
    end

    request("stop_kindly", body)
  end

  def stop_s2s_connections : HTTP::Client::Response
    request("stop_s2s_connections", "{}")
  end

  def subscribe_room(user : String, nick : String, room : String, nodes : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "nick", nick
        json.field "room", room
        json.field "nodes", nodes
      end
    end

    request("subscribe_room", body)
  end

  def unregister(user : String, host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
      end
    end

    request("unregister", body)
  end

  def unsubscribe_room(user : String, room : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "room", room
      end
    end

    request("unsubscribe_room", body)
  end

  def update(mod : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "module", mod
      end
    end

    request("update", body)
  end

  def update_list : HTTP::Client::Response
    request("update_list", "{}")
  end

  def user_resources(user : String, host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
      end
    end

    request("user_resources", body)
  end

  def user_sessions_info(user : String, host : String) : HTTP::Client::Response
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", host
      end
    end

    request("user_sessions_info", body)
  end

  private def request(uri : String, body) : HTTP::Client::Response
    response = HTTP::Client.post("#{@api_url}/api/#{uri}", headers: HTTP::Headers{"Content-Type" => "application/json"}, body: body)
    response
  end
end