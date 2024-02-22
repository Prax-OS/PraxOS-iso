let
  cmde = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDt/PsP74K5vSsiCsbLgomCjIUa0a2YNWfIEGwePbtm2";
in 

{
  "secrets.age".publicKeys = [cmde];
}
