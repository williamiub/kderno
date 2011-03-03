program KDerno;

uses
  Forms,
  UDmKDerno in 'UDmKDerno.pas' {TdmSkinEditor},
  UMenu in 'UMenu.pas' {FMenu},
  USPlash in 'USPlash.pas' {FSplash};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'KDerno';
  Application.CreateForm(TFMenu, FMenu);
  Application.CreateForm(TdmSkinEditor, dmSkinEditor);
  Application.CreateForm(TFSplash, FSplash);
  FMenu.SkinSelectorVisible := True;
  FMenu.Caption := 'KDerno';
  Application.Run;
end.
