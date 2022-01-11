{ pkgs, ... }:

{
  users.users.brockm = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    # hashedPassword = "$6$5afzstoy9svt/Nmk$MdFB0xk07JYP7ME6EtAlTA0g5xssFYJePX.Hvc9YsneMUXQo8il77mUDRATdgvjtoYAuNvh16LJOFrKfCSxvv/";
    initialPassword = "Password";
  };
}
