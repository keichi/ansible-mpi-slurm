# $bandwidth_host_to_switch = {
# # [MAC_address, Datapath_ID] => Bandwidth(bps),
#   [0x000000010001, 1] => 10000000.0,
#   [0x000000010003, 2] => 50000000.5,
#   ...
# }
$bandwidth_host_to_switch = {
  [0x525400111111, 3] => 1000000.0,
  [0x525400222222, 3] => 1000000.0,
  [0x525400333333, 4] => 1000000.0,
  [0x525400444444, 4] => 1000000.0,
}

# $bandwidth_switch_to_host = {
# # [Datapath_ID, MAC_address] => Bandwidth(bps),
#   [1, 0x000000010001] => 10000000.0,
#   [2, 0x000000010003] => 50000000.0,
#   ...
# }
$bandwidth_switch_to_host = {
  [3, 0x525400111111] => 1000000.0,
  [3, 0x525400222222] => 1000000.0,
  [4, 0x525400333333] => 1000000.0,
  [4, 0x525400444444] => 1000000.0,
}

# $bandwidth_switch_to_switch = {
# # [Datapath_ID, Datapath_ID] => Bandwidth(bps),
#   [2, 3] => 25000000.25,
#   [3, 2] => 25000000.25,
#   ...
# }
$bandwidth_switch_to_switch = {
  [1, 3] => 1000000.0,
  [1, 4] => 1000000.0,
  [2, 3] => 1000000.0,
  [2, 4] => 1000000.0,
  [3, 1] => 1000000.0,
  [3, 2] => 1000000.0,
  [4, 1] => 1000000.0,
  [4, 2] => 1000000.0,
}

# $hostname_to_macaddr = {
# # "Hostname" => MAC_address,
#   "foo" => 0x000000010001,
#   "bar" => 0x000000010003,
# }
$hostname_to_macaddr = {
  "host01-d.example.com" => "0x525400111111",
  "host02-d.example.com" => "0x525400222222",
  "host03-d.example.com" => "0x525400333333",
  "host04-d.example.com" => "0x525400444444",
}

# $dpid_to_switchname = {
# # Datapath_ID => "Switchname",
#   2 => "swfoo",
#   3 => "swbar",
# }
$dpid_to_switchname = {
  1 => "ovsbr1",
  2 => "ovsbr2",
  3 => "ovsbr3",
  4 => "ovsbr4",
}
