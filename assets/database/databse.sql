/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     5.5.2017 18:04:52                            */
/*==============================================================*/

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS mutations;
DROP TABLE IF EXISTS languages;



/*==============================================================*/
/* Table: users                                                 */
/*==============================================================*/
create table users
(
   id                   SERIAL,
   email                varchar(255) not null,
   password             varchar(255) not null,
   primary key (id),
   constraint unique_email unique (email)
) ENGINE=InnoDB CHARACTER SET utf8
;

/*==============================================================*/
/* Table: languages                                             */
/*==============================================================*/
create TABLE languages
(
  id                    SERIAL,
  code                  varchar(10) not null DEFAULT "",
  name                  varchar(50) not null DEFAULT "",
  img                   TEXT,
  position              INTEGER not NULL DEFAULT 696969,
  primary key (id),
  constraint unique_language unique (code)
) ENGINE=InnoDB CHARACTER SET utf8
;

/*==============================================================*/
/* Table: mutations                                             */
/*==============================================================*/
create TABLE mutations
(
  id                    SERIAL,
  lang_id               BIGINT UNSIGNED not null,
  content               TEXT,
  last_update           TIMESTAMP,
  deprecated            BOOLEAN,
  primary key (id),
  constraint FK_commonRights_lang foreign key (lang_id)
  references languages (id)
) ENGINE=InnoDB CHARACTER SET utf8
;



--
-- Vypisuji data pro tabulku `users`
--
INSERT INTO `languages`(`code`,`name`,`img`,`position`) VALUES ("cz","čeština","Czech-Republic.png",1);
INSERT INTO `languages`(`code`,`name`,`img`,`position`) VALUES ("en","english","United-Kingdom.png",2);
INSERT INTO `users`(`id`,`email`, `password`) VALUES (69,"example@example.cz", "$2y$10$4iP5iusxv7MAYDaB92moYuZdhEK.51V4j9mv7pSQbJnjP5NBG4BMa");
INSERT INTO `mutations`(`lang_id`,`content`, `deprecated`) VALUES (1,'{
      "lang": "cz",
      "langLong": "čeština",
      "menu": ["Naše služby", "O nás", "Kontakt"],
      "pages": {
        "homepage": {
          "code": "homepage",
          "welcomeHeading": "Firma s dlouholetou praxí ve finančním a krizovém řízení nebo poradenství",
          "welcomeSubHeading": "Nabízíme odborné služby pro vaši organizaci",
          "welcomeLink": "Více o našich službách",
          "aboutHeading": "O nás",
          "aboutSubHeading": "Ing. Martin Ježek, FCCA",
          "aboutDescription": "Zakladatel Martin se po přečtení životopisu Lee laccosy rozhodl, že jednou bude krizovým manažerem. Dnes má již dvacet let praxe ve finančním řízení a několik úspěšně zvládnutých interim management projektů.",
          "ourServicesHeading": "Naše služby",
          "redBlocks": [
            {
              "heading": "Interim management",
              "code": "interim",
              "items": ["první položka", "druhá položka"]
            },
            {
              "heading": "Odborné poradenství",
              "code": "advisory",
              "items": ["první položka", "druhá položka"]
            }
          ]
        },
        "service_1": {
          "code": "interim",
          "welcomeHeading": "Interim management",
          "blocks": [
            {
              "heading": "Substituční interim management",
              "items": [
                {
                  "subHeading": "Pro koho je určeno",
                  "description": "zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer"
                },
                {
                  "subHeading": "cíl",
                  "description": "zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer"
                },
                {
                  "subHeading": "Obvyklý rozsah",
                  "description": "zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer"
                }
              ]
            },
            {
              "heading": "Náhradní interim management",
              "items": [
                {
                  "subHeading": "Pro koho je určeno",
                  "description": "zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer"
                },
                {
                  "subHeading": "cíl",
                  "description": "zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer"
                },
                {
                  "subHeading": "Obvyklý rozsah",
                  "description": "zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer"
                }
              ]
            }
          ]
        },
        "service_2": {
          "code": "advisory",
          "welcomeHeading": "odborné poradenství",
          "blocks": [
            {
              "heading": "M/A asistence",
              "items": [
                {
                  "subHeading": "Pro koho je určeno",
                  "description": "zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer"
                },
                {
                  "subHeading": "cíl",
                  "description": "zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer"
                },
                {
                  "subHeading": "Obvyklý rozsah",
                  "description": "zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer"
                }
              ]
            }
          ]
        }
      },
      "contact": {
        "heading": "kontakt",
        "address": ["nazev adresy", "adresa", "castPrahy + psč"],
        "email": "Martin.Jezek@trunima.eu",
        "dataBox": "Datová schránka: z48s8i",
        "ico": "CZ885478",
        "formItems": {
          "name": "jméno",
          "email": "email",
          "subject": "predmet",
          "text": "zpráva"
        },
        "sendButton": "Odeslat formulář"
      }
    }',0);
INSERT INTO `mutations`(`lang_id`,`content`, `deprecated`) VALUES (2,'{
      "lang": "en",
      "langLong": "english",
      "menu": ["Our services", "About us", "Contact"],
      "pages": {
        "homepage": {
          "code": "homepage",
          "welcomeHeading": "Firma s dlouholetou praxí ve finančním a krizovém řízení nebo poradenství",
          "welcomeSubHeading": "Nabízíme odborné služby pro vaši organizaci",
          "welcomeLink": "Více o našich službách",
          "aboutHeading": "O nás",
          "aboutSubHeading": "Ing. Martin Ježek, FCCA",
          "aboutDescription": "Zakladatel Martin se po přečtení životopisu Lee laccosy rozhodl, že jednou bude krizovým manažerem. Dnes má již dvacet let praxe ve finančním řízení a několik úspěšně zvládnutých interim management projektů.",
          "ourServicesHeading": "Naše služby",
          "redBlocks": [
            {
              "heading": "Interim management",
              "code": "interim",
              "items": ["první položka", "druhá položka"]
            },
            {
              "heading": "Odborné poradenství",
              "code": "advisory",
              "items": ["první položka", "druhá položka"]
            }
          ]
        },
        "service_1": {
          "code": "interim",
          "welcomeHeading": "Interim management",
          "blocks": [
            {
              "heading": "Substituční interim management",
              "items": [
                {
                  "subHeading": "cíl",
                  "description": "zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer"
                }
              ]
            }
          ]
        },
        "service_2": {
          "code": "advisory",
          "welcomeHeading": "odborné poradenství",
          "blocks": [
            {
              "heading": "M/A asistence",
              "items": [
                {
                  "subHeading": "Pro koho je určeno",
                  "description": "zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer"
                },
                {
                  "subHeading": "cíl",
                  "description": "zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer"
                },
                {
                  "subHeading": "Obvyklý rozsah",
                  "description": "zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer"
                }
              ]
            }
          ]
        }
        },
      "contact": {
        "heading": "kontakt",
        "address": ["nazev adresy", "adresa", "castPrahy + psč"],
        "email": "Martin.Jezek@trunima.eu",
        "dataBox": "Datová schránka: z48s8i",
        "ico": "CZ885478",
        "formItems": {
          "name": "jméno",
          "email": "email",
          "subject": "predmet",
          "text": "zpráva"
        },
        "sendButton": "Odeslat formulář"
      }
    }',0);

