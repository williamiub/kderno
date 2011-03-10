program KDerno;

uses
  Forms,
  Dialogs,
  UDmKDerno in 'UDmKDerno.pas' {DmKderno},
  UMenu in 'UMenu.pas' {FMenu},
  USPlash in 'USPlash.pas' {FSplash},
  UThreadSplash in 'UThreadSplash.pas',
  Alx in 'Alx.pas',
  ULogin in 'ULogin.pas' {FLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'KDerno';
  Application.CreateForm(TFMenu, FMenu);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFSplash, FSplash);
  FMenu.SkinSelectorVisible := True;
  FMenu.Caption := 'KDerno';
  Application.Run;
end.
