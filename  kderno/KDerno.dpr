program KDerno;

uses
  Forms,
  Dialogs,
  sysutils,
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
  Application.ShowMainForm:=false;
  USPlash.FSplash.Visible:=true;
  FMenu.SkinSelectorVisible := True;
  FMenu.Caption := 'KDerno';

  USplash.FSplash.Show;
     USplash.FSplash.SPProgress.Repaint;
     USplash.FSplash.SPProgress.Refresh;
     Sleep(60);

    

     USplash.FSplash.SpProgress.Position:=USplash.FSplash.SpProgress.Position+20;
     //USplash.FSplash.SpProgress2.Width:=USplash.FSplash.SpProgress.Width-35;

     Application.ProcessMessages;
     Sleep(60);


     USplash.FSplash.SpProgress.Position:=USplash.FSplash.SpProgress.Position+15;
     //USplash.FSplash.SpProgress2.Width:=USplash.FSplash.SpProgress.Width-45;

     Application.ProcessMessages;
     USplash.FSplash.SPProgress.Repaint;
     USplash.FSplash.SPProgress.Refresh;
     Sleep(200);

     USplash.FSplash.SpProgress.Position:=USplash.FSplash.SpProgress.Position+25;

     Application.ProcessMessages;
     USplash.FSplash.SPProgress.Repaint;
     USplash.FSplash.SPProgress.Refresh;
     Sleep(60);

     USplash.FSplash.SpProgress.Position:=USplash.FSplash.SpProgress.Position+15;


     Application.ProcessMessages;
     USplash.FSplash.SPProgress.Repaint;
     USplash.FSplash.SPProgress.Refresh;
     Sleep(60);

     USplash.FSplash.SpProgress.Position:=USplash.FSplash.SpProgress.Position+25;


     Application.ProcessMessages;
     USPlash.FSplash.SPProgress.Repaint;
     USPlash.FSplash.SPProgress.Refresh;
     Sleep(60);
     USPlash.FSplash.Close;

     ULogin.FLogin.Show;
     Application.Run;

end.
