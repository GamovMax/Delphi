object Programm: TProgramm
  Left = 210
  Top = 179
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = 'Programm'
  ClientHeight = 162
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 275
    Height = 20
    Caption = #1050#1091#1088#1089#1086#1074#1086#1081' '#1087#1088#1086#1077#1082#1090' '#1087#1086' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 48
    Top = 48
    Width = 230
    Height = 20
    BiDiMode = bdLeftToRight
    Caption = '"'#1052#1072#1090#1077#1084#1072#1090#1080#1095#1077#1089#1082#1080#1077' '#1084#1077#1090#1086#1076#1099'"'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Button1: TButton
    Left = 96
    Top = 96
    Width = 129
    Height = 25
    Caption = #1054#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
end
