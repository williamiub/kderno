program KDerno;

uses
  Forms,
  UDmMenu in 'UDmMenu.pas' {TdmSkinEditor},
  UMenu in 'UMenu.pas' {FMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'KDerno';
  Application.CreateForm(TFMenu, FMenu);
  Application.CreateForm(TdmSkinEditor, dmSkinEditor);
  FMenu.SkinSelectorVisible := True;
  FMenu.Caption := 'KDerno';
  Application.Run;
end.
