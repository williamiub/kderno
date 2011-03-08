program KDerno;

uses
  Forms,
  Dialogs,
  UDmKDerno in 'UDmKDerno.pas' {DmKderno},
  UMenu in 'UMenu.pas' {FMenu},
  USPlash in 'USPlash.pas' {FSplash};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'KDerno';
  Application.CreateForm(TFSplash, FSplash);
  Application.CreateForm(TFMenu, FMenu);
  FMenu.SkinSelectorVisible := True;
  FMenu.Caption := 'KDerno';
  Application.Run;
end.
