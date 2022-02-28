object Form1: TForm1
  Left = 358
  Height = 144
  Top = 185
  Width = 716
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  BorderWidth = 1
  Caption = 'Réduction PDF'
  ClientHeight = 144
  ClientWidth = 716
  Color = clGradientInactiveCaption
  OnCreate = FormCreate
  Position = poDesktopCenter
  LCLVersion = '7.5'
  object Panel1: TPanel
    Left = 1
    Height = 139
    Top = 1
    Width = 714
    Align = alTop
    Anchors = [akTop, akLeft, akRight, akBottom]
    BevelOuter = bvNone
    BorderWidth = 1
    ClientHeight = 139
    ClientWidth = 714
    TabOrder = 0
    object Button1: TButton
      Left = 472
      Height = 52
      Top = 80
      Width = 112
      Caption = 'Exécuter'
      Color = clGradientActiveCaption
      Font.Height = -20
      OnClick = Fichier_resultat
      ParentFont = False
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 8
      Height = 32
      Top = 40
      Width = 648
      Anchors = [akTop, akLeft, akBottom]
      Color = clWindow
      DoubleBuffered = False
      Font.Color = clBlack
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object Label2: TLabel
      Left = 8
      Height = 24
      Top = 104
      Width = 75
      Caption = 'Label2'
      Color = clHotLight
      Font.Color = clHighlight
      Font.Height = -20
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
    end
    object Label3: TLabel
      Left = 8
      Height = 24
      Top = 8
      Width = 241
      Caption = 'Fichier PDF à réduire'
      Color = clHotLight
      Font.Color = clHighlight
      Font.Height = -20
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
    end
    object Button2: TButton
      Left = 592
      Height = 52
      Top = 80
      Width = 112
      Caption = '&Fermer'
      Color = clGradientActiveCaption
      Font.Height = -20
      OnClick = Button2Click
      ParentFont = False
      TabOrder = 2
    end
    object Button3: TButton
      Left = 664
      Height = 32
      Top = 40
      Width = 40
      Caption = '...'
      OnClick = Button3Click
      TabOrder = 3
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 352
    Top = 80
  end
end
