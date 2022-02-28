unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls , process, FileUtil;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Function  Works_pdf() : boolean;
    procedure Fichier_resultat(Sender : TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.frm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
     Label2.Visible:= False;
     Button1.Visible:= False ;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
          Close;
end;

procedure TForm1.Button3Click(Sender: TObject);
var chemin : String ;
    reponse : Boolean ;
begin
          label2.Caption:= '';
          label2.visible := True ;
          reponse :=  OpenDialog1.Execute;
          chemin :=  OpenDialog1.FileName;
          if reponse then
          begin
              if ( ( ExtractFileExt(chemin) = '.pdf') or (ExtractFileExt(chemin) = '.PDF' )) then
              begin
                   Edit1.Text:= chemin ;
                   label2.caption := FileSize(chemin).ToString() ;
                   Button1.Visible:=true;
              end
              else
              begin
                   Label2.Caption:= 'Format non conforme (PDF)';
                   Label2.Visible := True;
                   Button1.Visible:= False;
              end;
          end
          else
          begin
               Edit1.Text:='';
               Label2.Caption:= '';
               Button1.Visible:= False;
          end;

end;

function TForm1.Works_pdf() : boolean;
var AProcess : TProcess ;
begin
     if Edit1.GetTextLen > 0 then
     begin
         // execution du programme de reduction d'un fichier pdf
         AProcess := TProcess.Create(nil);
         AProcess.Executable:= '/usr/bin/ps2pdf';
         AProcess.Parameters.Add(Edit1.Text);
         AProcess.Parameters.Add(Edit1.Text + '1');
         AProcess.Options := AProcess.Options + [poWaitOnExit];
         AProcess.Execute;
         AProcess.Free;
         Label2.Visible:= True;
         Button1.Visible:=False;
         result := True ;
     End
     else
     begin
          Label2.Visible:= True;
          label2.caption := 'Une erreur est survenue...' ;
          result := False ;

     end;


end;

procedure TForm1.Fichier_resultat(Sender : TObject);
var dat_old , dat_new : String ;
begin

         if  Works_pdf() = True then
         begin
              // fichier source effacé et nouveau fichier renommé
              dat_old := Edit1.Text + '1' ;
              dat_new := Edit1.Text;

              DeleteFile(dat_new);
              RenameFile(dat_old, dat_new) ;

              label2.caption :=  'OK -> ' + FileSize(edit1.text).ToString() ;
              Label2.Visible:= True;

         end;


end;

end.

