require "http/client"
require "json"

# TODO: Write documentation for `Ejabberd`
class Ejabberd
  def initialize(@api_url : String, @host : String)
  end

  def register(user : String, password : String)
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", @host
        json.field "password", password
      end
    end

    request("register", body)
  end

  def add_rosteritem(localuser : String, localserver : String, user : String, server : String, nick : String, group : String, subs : String)
    body = JSON.build do |json|
      json.object do
        json.field "localuser", localuser
        json.field "localserver", localserver
        json.field "user", user
        json.field "server", server
        json.field "nick", nick
        json.field "group", group
        json.field "subs", subs
      end
    end

    request("add_rosteritem", body)
  end

  def backup(file : String)
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("backup", body)
  end

  def ban_account(user : String, reason : String)
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", @host
        json.field "reason", reason
      end
    end

    request("ban_account", body)
  end

  def change_password(user : String, new_pass : String)
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", @host
        json.field "newpass", new_pass
      end
    end

    request("change_password", body)
  end

  def change_room_option(name : String, service : String, option : String, value : String)
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

  def check_account(user : String)
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", @host
      end
    end

    request("check_account", body)
  end

  def check_password(user : String, password : String)
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", @host
        json.field "password", password
      end
    end

    request("check_password", body)
  end

  def check_password_hash(user : String, password_hash : String, hash_method : String)
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", @host
        json.field "passwordhash", password_hash
        json.field "hashmethod", hash_method
      end
    end

    request("check_password_hash", body)
  end

  def clear_cache
    request("clear_cache", "{}")
  end

  def compile(file : String)
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("compile", body)
  end

  def connected_users
    request("connected_users", "{}")
  end

  def connected_users_info
    request("connected_users_info", "{}")
  end

  def connected_users_number
    request("connected_users_number", "{}")
  end

  def connected_users_vhost
    body = JSON.build do |json|
      json.object do
        json.field "host", @host
      end
    end

    request("connected_users_vhost", body)
  end

  def convert_to_scram
    body = JSON.build do |json|
      json.object do
        json.field "host", @host
      end
    end

    request("convert_to_scram", body)
  end

  def convert_to_yaml(in_ : String, out_ : String)
    body = JSON.build do |json|
      json.object do
        json.field "in", in_
        json.field "out", out_
      end
    end

    request("convert_to_yaml", body)
  end

  def create_room(name : String, service : String)
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "service", service
        json.field "host", @host
      end
    end

    request("create_room", body)
  end

  def create_room_with_opts(name : String, service : String, option : Hash(String, String))
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "service", service
        json.field "host", @host
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

  def create_rooms_file(file : String)
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("create_rooms_file", body)
  end

  def delete_expired_messages
    request("delete_expired_messages", "{}")
  end

  def delete_mnesia
    body = JSON.build do |json|
      json.object do
        json.field "host", @host
      end
    end

    request("delete_mnesia", body)
  end

  def delete_old_messages(days : String)
    body = JSON.build do |json|
      json.object do
        json.field "days", days
      end
    end

    request("delete_old_messages", body)
  end

  def delete_old_users(days : String)
    body = JSON.build do |json|
      json.object do
        json.field "days", days
      end
    end

    request("delete_old_users", body)
  end

  def delete_old_users_vhost(days : String)
    body = JSON.build do |json|
      json.object do
        json.field "host", @host
        json.field "days", days
      end
    end

    request("delete_old_users_vhost", body)
  end

  def delete_rosteritem(localuser : String, localserver : String, user : String, server : String)
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

  def destroy_room(name : String, service : String)
    body = JSON.build do |json|
      json.object do
        json.field "name", name
        json.field "service", service
      end
    end

    request("destroy_room", body)
  end

  def destroy_rooms_file(file : String)
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("destroy_rooms_file", body)
  end

  def dump(file : String)
    body = JSON.build do |json|
      json.object do
        json.field "file", file
      end
    end

    request("dump", body)
  end

  def dump_table(file : String, table : String)
    body = JSON.build do |json|
      json.object do
        json.field "file", file
        json.field "table", table
      end
    end

    request("dump_table", body)
  end

  def export2sql(days : String, file : String)
    body = JSON.build do |json|
      json.object do
        json.field "host", @host
        json.field "file", file
      end
    end

    request("export2sql", body)
  end

  def export_piefxis(dir : String)
    body = JSON.build do |json|
      json.object do
        json.field "dir", dir
      end
    end

    request("export_piefxis", body)
  end

  def export_piefxis_host(dir : String)
    body = JSON.build do |json|
      json.object do
        json.field "dir", dir
        json.field "host", @host
      end
    end

    request("export_piefxis_host", body)
  end

  def gen_html_doc_for_commands(dir : String, regexp : String, examples : String)
    body = JSON.build do |json|
      json.object do
        json.field "file", file
        json.field "regexp", regexp
        json.field "examples", examples
      end
    end

    request("gen_html_doc_for_commands", body)
  end

  def gen_markdown_doc_for_commands(dir : String, regexp : String, examples : String)
    body = JSON.build do |json|
      json.object do
        json.field "file", file
        json.field "regexp", regexp
        json.field "examples", examples
      end
    end

    request("gen_markdown_doc_for_commands", body)
  end

  def get_certificates(domains : String)
    body = JSON.build do |json|
      json.object do
        json.field "domains", domains
      end
    end

    request("get_certificates", body)
  end

  def get_cookie
    request("get_cookie", "{}")
  end

  def get_last(user : String)
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "host", @host
      end
    end

    request("get_last", body)
  end

  def get_loglevel
    request("get_loglevel", "{}")
  end

  def get_offline_count(user : String, server : String)
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "server", server
      end
    end

    request("get_offline_count", body)
  end

  def get_presence(user : String, server : String)
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "server", server
      end
    end

    request("get_presence", body)
  end

  def get_presence(user : String, server : String)
    body = JSON.build do |json|
      json.object do
        json.field "user", user
        json.field "server", server
      end
    end

    request("get_presence", body)
  end

  private def request(uri : String, body)
    response = HTTP::Client.post("#{@api_url}/api/#{uri}", headers: HTTP::Headers{"Content-Type" => "application/json"}, body: body)
    response.status_code
  end
end

