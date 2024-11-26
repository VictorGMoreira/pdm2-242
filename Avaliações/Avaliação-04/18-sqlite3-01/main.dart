{\rtf1\ansi\ansicpg1252\cocoartf2513
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red89\green138\blue67;\red24\green24\blue24;\red193\green193\blue193;
\red70\green137\blue204;\red194\green126\blue101;\red212\green214\blue154;\red202\green202\blue202;\red140\green211\blue254;
\red67\green192\blue160;\red183\green111\blue179;\red167\green197\blue152;}
{\*\expandedcolortbl;;\cssrgb\c41569\c60000\c33333;\cssrgb\c12157\c12157\c12157;\cssrgb\c80000\c80000\c80000;
\cssrgb\c33725\c61176\c83922;\cssrgb\c80784\c56863\c47059;\cssrgb\c86275\c86275\c66667;\cssrgb\c83137\c83137\c83137;\cssrgb\c61176\c86275\c99608;
\cssrgb\c30588\c78824\c69020;\cssrgb\c77255\c52549\c75294;\cssrgb\c70980\c80784\c65882;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl360\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 // Exemplo do Pacote sqlite3 2.1.0\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 //\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 import\cf4 \strokec4  \cf6 \strokec6 'dart:io'\cf4 \strokec4 ;\cb1 \
\
\cf5 \cb3 \strokec5 import\cf4 \strokec4  \cf6 \strokec6 'package:sqlite3/sqlite3.dart'\cf4 \strokec4 ;\cb1 \
\
\cf5 \cb3 \strokec5 void\cf4 \strokec4  \cf7 \strokec7 main\cf4 \strokec4 () \{\cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3   \cf7 \strokec7 print\cf4 \strokec4 (\cf6 \strokec6 'Using sqlite3 \cf8 \strokec8 $\{\cf9 \strokec9 sqlite3\cf8 \strokec8 .\cf9 \strokec9 version\cf8 \strokec8 \}\cf6 \strokec6 '\cf4 \strokec4 );\cb1 \
\
\cb3   \cf2 \strokec2 // Create a new in-memory database. To use a database backed by a file, you\cf4 \cb1 \strokec4 \
\cb3   \cf2 \strokec2 // can replace this with sqlite3.open(yourFilePath).\cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 final\cf4 \strokec4  \cf9 \strokec9 db\cf4 \strokec4  \cf8 \strokec8 =\cf4 \strokec4  \cf9 \strokec9 sqlite3\cf4 \strokec4 .\cf7 \strokec7 openInMemory\cf4 \strokec4 ();\cb1 \
\
\cb3   \cf2 \strokec2 // Create a table and insert some data\cf4 \cb1 \strokec4 \
\cb3   \cf9 \strokec9 db\cf4 \strokec4 .\cf7 \strokec7 execute\cf4 \strokec4 (\cf6 \strokec6 '''\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6     CREATE TABLE TB_ALUNO (\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6       id INTEGER NOT NULL PRIMARY KEY,\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6       name TEXT NOT NULL\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6     );\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6   '''\cf4 \strokec4 );\cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3   \cf2 \strokec2 // Prepare a statement to run it multiple times:\cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 final\cf4 \strokec4  \cf9 \strokec9 stmt\cf4 \strokec4  \cf8 \strokec8 =\cf4 \strokec4  \cf9 \strokec9 db\cf4 \strokec4 .\cf7 \strokec7 prepare\cf4 \strokec4 (\cf6 \strokec6 'INSERT INTO TB_ALUNO (name) VALUES (?)'\cf4 \strokec4 );\cb1 \
\cb3   \cf9 \strokec9 stmt\cf4 \cb1 \strokec4 \
\cb3     ..\cf7 \strokec7 execute\cf4 \strokec4 ([\cf6 \strokec6 ' Victor Gabriel'\cf4 \strokec4 ])\cb1 \
\cb3     ..\cf7 \strokec7 execute\cf4 \strokec4 ([\cf6 \strokec6 'Ruth Rodrigues'\cf4 \strokec4 ]);\cb1 \
\
\cb3   \cf2 \strokec2 // Dispose a statement when you don't need it anymore to clean up resources.\cf4 \cb1 \strokec4 \
\cb3   \cf9 \strokec9 stmt\cf4 \strokec4 .\cf7 \strokec7 dispose\cf4 \strokec4 ();\cb1 \
\
\cb3   \cf2 \strokec2 // You can run select statements with PreparedStatement.select, or directly\cf4 \cb1 \strokec4 \
\cb3   \cf2 \strokec2 // on the database:\cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 final\cf4 \strokec4  \cf10 \strokec10 ResultSet\cf4 \strokec4  \cf9 \strokec9 resultSet\cf4 \strokec4  \cf8 \strokec8 =\cf4 \cb1 \strokec4 \
\cb3       \cf9 \strokec9 db\cf4 \strokec4 .\cf7 \strokec7 select\cf4 \strokec4 (\cf6 \strokec6 'SELECT * FROM TB_ALUNO'\cf4 \strokec4 );\cb1 \
\
\cb3   \cf2 \strokec2 // You can iterate on the result set in multiple ways to retrieve Row objects\cf4 \cb1 \strokec4 \
\cb3   \cf2 \strokec2 // one by one.\cf4 \cb1 \strokec4 \
\cb3   \cf11 \strokec11 for\cf4 \strokec4  (\cf5 \strokec5 final\cf4 \strokec4  \cf10 \strokec10 Row\cf4 \strokec4  \cf9 \strokec9 row\cf4 \strokec4  \cf11 \strokec11 in\cf4 \strokec4  \cf9 \strokec9 resultSet\cf4 \strokec4 ) \{\cb1 \
\cb3     \cf7 \strokec7 print\cf4 \strokec4 (\cf6 \strokec6 'ALunos: [id: \cf8 \strokec8 $\{\cf9 \strokec9 row\cf8 \strokec8 [\cf6 \strokec6 'id'\cf8 \strokec8 ]\}\cf6 \strokec6 , name: \cf8 \strokec8 $\{\cf9 \strokec9 row\cf8 \strokec8 [\cf6 \strokec6 'name'\cf8 \strokec8 ]\}\cf6 \strokec6 ]'\cf4 \strokec4 );\cb1 \
\cb3   \}\cb1 \
\
\cb3   \cf2 \strokec2 // Register a custom function we can invoke from sql:\cf4 \cb1 \strokec4 \
\cb3   \cf9 \strokec9 db\cf4 \strokec4 .\cf7 \strokec7 createFunction\cf4 \strokec4 (\cb1 \
\cb3     \cf9 \strokec9 functionName\cf8 \strokec8 :\cf4 \strokec4  \cf6 \strokec6 'dart_version'\cf4 \strokec4 ,\cb1 \
\cb3     \cf9 \strokec9 argumentCount\cf8 \strokec8 :\cf4 \strokec4  \cf5 \strokec5 const\cf4 \strokec4  \cf10 \strokec10 AllowedArgumentCount\cf4 \strokec4 (\cf12 \strokec12 0\cf4 \strokec4 ),\cb1 \
\cb3     \cf9 \strokec9 function\cf8 \strokec8 :\cf4 \strokec4  (\cf9 \strokec9 args\cf4 \strokec4 ) \cf8 \strokec8 =>\cf4 \strokec4  \cf10 \strokec10 Platform\cf4 \strokec4 .\cf9 \strokec9 version\cf4 \strokec4 ,\cb1 \
\cb3   );\cb1 \
\cb3   \cf7 \strokec7 print\cf4 \strokec4 (\cf9 \strokec9 db\cf4 \strokec4 .\cf7 \strokec7 select\cf4 \strokec4 (\cf6 \strokec6 'SELECT dart_version()'\cf4 \strokec4 ));\cb1 \
\
\cb3   \cf2 \strokec2 // Don't forget to dispose the database to avoid memory leaks\cf4 \cb1 \strokec4 \
\cb3   \cf9 \strokec9 db\cf4 \strokec4 .\cf7 \strokec7 dispose\cf4 \strokec4 ();\cb1 \
\cb3 \}\cb1 \
\
}