{\rtf1\ansi\ansicpg1252\cocoartf2513
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 import 'dart:convert';\
\
class Dependente \{\
  late String _nome;\
\
  Dependente(String nome) \{\
    this._nome = nome;\
  \}\
\
  // M\'e9todo para converter o objeto Dependente em um Map (para exportar como JSON)\
  Map<String, dynamic> toJson() \{\
    return \{'nome': _nome\};\
  \}\
\}\
\
class Funcionario \{\
  late String _nome;\
  late List<Dependente> _dependentes;\
\
  Funcionario(String nome, List<Dependente> dependentes) \{\
    this._nome = nome;\
    this._dependentes = dependentes;\
  \}\
\
  // M\'e9todo para converter o objeto Funcionario em um Map (para exportar como JSON)\
  Map<String, dynamic> toJson() \{\
    return \{\
      'nome': _nome,\
      'dependentes': _dependentes.map((d) => d.toJson()).toList(),\
    \};\
  \}\
\}\
\
class EquipeProjeto \{\
  late String _nomeProjeto;\
  late List<Funcionario> _funcionarios;\
\
  EquipeProjeto(String nomeProjeto, List<Funcionario> funcionarios) \{\
    _nomeProjeto = nomeProjeto;\
    _funcionarios = funcionarios;\
  \}\
\
  // M\'e9todo para converter o objeto EquipeProjeto em um Map (para exportar como JSON)\
  Map<String, dynamic> toJson() \{\
    return \{\
      'nomeProjeto': _nomeProjeto,\
      'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),\
    \};\
  \}\
\}\
\
void main() \{\
  // 1. Criar v\'e1rios objetos Dependentes\
  Dependente dependente1 = Dependente('Marcos');\
  Dependente dependente2 = Dependente('Pedro');\
  Dependente dependente3 = Dependente('Renato');\
  \
  // 2. Criar v\'e1rios objetos Funcionarios\
  Funcionario funcionario1 = Funcionario('Marcos', [dependente1, dependente2]);\
  Funcionario funcionario2 = Funcionario('Ana', [dependente3]);\
  \
  // 3. Associar os Dependentes criados aos respectivos Funcionarios\
  // (Feito no momento de criar os Funcionarios com a lista de dependentes)\
  \
  // 4. Criar uma lista de Funcionarios\
  List<Funcionario> funcionarios = [funcionario1, funcionario2];\
  \
  // 5. Criar uma EquipeProjeto\
  EquipeProjeto equipe = EquipeProjeto('Projeto PDM II', funcionarios);\
  \
  // 6. Printar no formato JSON\
  String equipeJson = jsonEncode(equipe.toJson());\
  print(equipeJson);\
\}\
}