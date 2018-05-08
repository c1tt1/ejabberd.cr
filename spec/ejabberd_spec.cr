require "./spec_helper"

describe Ejabberd do
  describe "#add_rosteritem" do
    it "add an item to a user's roster" do
      user = Random::Secure.hex(2)
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      ejabberd.register(user, "localhost", "password")
      res = ejabberd.add_rosteritem(user, "localhost", "alice", "localhost", "alice", "friends", "both")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#backup" do
    it "store the database to backup file" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.backup("/var/lib/database.backup")
      res.status_code.to_s.should eq "200"
    end
  end

  describe "#ban_account" do
    it "ban an account and provide reason" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.ban_account("", "localhost", "for spamming others")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#change_password" do
    it "change the password of an account" do
      user = Random::Secure.hex(2)
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      ejabberd.register(user, "localhost", "hello")
      res = ejabberd.change_password(user, "localhost", "new_pass")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#change_room_option" do
    it "change an option in a MUC room" do
      room = Random::Secure.hex(2)
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      ejabberd.create_room(room, "localhost", "localhost")
      res = ejabberd.change_room_option(room, "localhost", "members_only", "true")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#check_account" do
    it "check if an account exists or not" do
      user = Random::Secure.hex(2)
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      ejabberd.register(user, "localhost", "hello")
      res = ejabberd.check_account(user, "localhost")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#check_password" do
    it "check if a password is correct" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.check_password("gh", "localhost", "localhost")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#check_password_hash" do
    it "check if the password hash is correct" do
      user = Random::Secure.hex(2)
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      ejabberd.register(user, "localhost", "hello")
      res = ejabberd.check_password_hash(user, "localhost", "5d41402abc4b2a76b9719d911017c592", "md5")
      res.status_code.to_s.should eq "200"
    end
  end

  describe "#clear_cache" do
    it "clear database cache on all nodes" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.clear_cache
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#compile" do
    it "recompile and reload Erlang source code file" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.compile("/var/lib/mod_example.erl")
      res.status_code.to_s.should eq "200"
    end
  end

  describe "#connected_users" do
    it "list all established sessions" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.connected_users
      res.status_code.to_s.should eq "200"
      # res.body.should be(Array)
    end
  end

  describe "#connected_users_info" do
    it "list all established sessions and their information" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.connected_users_info
      res.status_code.to_s.should eq "200"
      # res.body.should be(Array)
    end
  end

  describe "#connected_users_number" do
    it "get the number of established sessions" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.connected_users_number
      res.status_code.to_s.should eq "200"
      # res.body.should be(Array)
      puts res.body
    end
  end

  describe "#connected_users_vhost" do
    it "get the list of established sessions in a vhost" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.connected_users_vhost("localhost")
      res.status_code.to_s.should eq "200"
      # res.body.should be(Array)
    end
  end

  describe "#convert_to_scram" do
    it "convert the passwords in 'users' ODBC table to SCRAM" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.convert_to_scram("ejabberd@localhost")
      # res.status_code.to_s.should eq "200"
      # res.body.should be(Array)
      puts res.body
    end
  end

  describe "#convert_to_yaml" do
    it "convert the input file from Erlang to YAML format" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.convert_to_yaml("/var/lib/ejabberd.cfg", "/var/lib/ejabberd.yml")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#create_room" do
    it "create a MUC room name@service in host" do
      room = Random::Secure.hex(2)
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.create_room(room, "localhost", "localhost")
      res.status_code.to_s.should eq "200"
    end
  end

  describe "#create_room_with_opts" do
    it "create a MUC room name@service in host with given options" do
      room = Random::Secure.hex(2)
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.create_room_with_opts(room, "localhost", "localhost", {"name" => "members_only", "value" => "true"})
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#create_rooms_file" do
    it "create the rooms indicated in file" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.create_rooms_file("/var/lib/rooms.txt")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#delete_expired_messages" do
    it "delete expired offline messages from database" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.delete_expired_messages
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#delete_mnesia" do
    it "delete elements in Mnesia database for a given vhost" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.delete_mnesia("localhost")
      # res.status_code.to_s.should eq "200"
      # res.body.to_s.should eq "0"
    end
  end

  describe "#delete_old_messages" do
    it "delete offline messages older than DAYS" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.delete_old_messages(21)
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#delete_old_users" do
    it "delete users that didn't log in last days, or that never logged" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.delete_old_users(21)
      res.status_code.to_s.should eq "200"
    end
  end

  describe "#delete_old_users_vhost" do
    it "delete users that didn't log in last days, or that never logged" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.delete_old_users_vhost("localhost", 21)
      res.status_code.to_s.should eq "200"
    end
  end

  describe "#delete_rosteritem" do
    it "delete an item from a user's roster (supports ODBC)" do
      user = Random::Secure.hex(2)
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.delete_rosteritem("localhost", "localhost", user, "localhost")
      res.status_code.to_s.should eq "200"
    end
  end

  describe "#destroy_room" do
    it "destroy a MUC room" do
      room = Random::Secure.hex(2)
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      ejabberd.create_room(room, "localhost", "localhost")
      res = ejabberd.destroy_room(room, "localhost")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#destroy_rooms_file" do
    it "destroy the rooms indicated in file" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.destroy_rooms_file("/var/lib/rooms.txt")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#dump" do
    it "dump the database to a text file" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.dump("/var/lib/database.txt")
      res.status_code.to_s.should eq "200"
    end
  end

  describe "#dump_table" do
    it "dump the database to a text file" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.dump_table("/var/lib/table-muc-registered.txt", "muc_registered")
      res.status_code.to_s.should eq "200"
    end
  end

  describe "#export2sql" do
    it "export virtual host information from Mnesia tables to SQL file" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.export2sql("localhost", "/var/lib/example.com.sql")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#export_piefxis" do
    it "export data of all users in the server to PIEFXIS files" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.export_piefxis("/var/lib/")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  # describe "#export_piefxis_host" do
  #   it "export data of users in a host to PIEFXIS files" do
  #     ejabberd = Ejabberd.new api_url: "localhost:5280"
  #     res = ejabberd.export_piefxis_host("/var/lib/", "localhost")
  #     # res.status_code.to_s.should eq "200"
  #     # res.body.to_s.should eq "0"
  #     p res.body
  #   end
  # end
end
