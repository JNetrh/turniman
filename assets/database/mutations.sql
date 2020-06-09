-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Stř 03. čen 2020, 18:41
-- Verze serveru: 5.7.19
-- Verze PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `jakubnetrhcz8`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `mutations`
--

CREATE TABLE `mutations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang_id` bigint(20) UNSIGNED NOT NULL,
  `content` text,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deprecated` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `mutations`
--

INSERT INTO `mutations` (`id`, `lang_id`, `content`, `last_update`, `deprecated`) VALUES
(1, 2, '{\r\n  \"lang\": \"cs\",\r\n  \"langLong\": \"čeština\",\r\n  \"menu\": [\"Naše služby\", \"Partneři\", \"Kontakt\"],\r\n  \"page_homepage_code\": \"homepage\",\r\n  \"page_homepage_welcomeHeading\": \"TURNIMAN Advisory, s.r.o.\",\r\n  \"page_homepage_welcomeSubHeading\": \"Specialisté na&nbsp;záchranu a&nbsp;stabilizaci<br />malých a&nbsp;středních podniků\",\r\n  \"page_homepage_welcomeLink\": \"Více o našich službách\",\r\n  \"page_homepage_aboutHeading\": \"O nás\",\r\n  \"page_homepage_subjectsHeading\": \"Partneři\",\r\n  \"page_homepage_subjectsSubHeading\": \"Nespoléháme jen na&nbsp;své&nbsp;zkušenosti. Spolupracujeme s&nbsp;prověřenými partnery&nbsp;v&nbsp;oborech.\",\r\n  \"page_homepage_subjects\": [\r\n    {\r\n      \"label\": \"Právní poradci\",\r\n      \"link\":\"https://www.samak.cz/\"\r\n    },\r\n    {\r\n      \"label\": \"Daňoví a účetní poradci\",\r\n      \"link\": \"https://www.samak.cz/\"\r\n    },\r\n    {\r\n      \"label\": \"M&A poradci\",\r\n      \"link\": \"https://www.samak.cz/\"\r\n    },\r\n    {\r\n      \"label\": \"Interim manažeři\",\r\n      \"link\": \"https://www.financnimanager.cz/\"\r\n    },\r\n    {\r\n      \"label\": \"Insolvenční správci\",\r\n      \"link\": null\r\n    },\r\n    {\r\n      \"label\": \"Znalecké ústavy\",\r\n      \"link\": \"http://www.equita.cz/\"\r\n    }\r\n  ],\r\n  \"page_homepage_ourServicesHeading\": \"Naše služby\",\r\n  \"page_homepage_redBlocks\": [\r\n    {\r\n      \"heading\":\"Restrukturalizace\",\r\n      \"code\":\"interim\",\r\n      \"items\":[\r\n        \"Restrukturalizace společnosti\",\r\n        \"Krizové řízení\",\r\n        \"Asistence insolvenčním správcům\"\r\n      ]\r\n    },\r\n    {\r\n      \"heading\":\"Akviziční poradenství\",\r\n      \"code\":\"advisory\",\r\n      \"items\":[\r\n        \"M&A asistence\",\r\n        \"Postakviziční transformace\"\r\n      ]\r\n    }\r\n  ],\r\n  \"service_1\": {\r\n    \"code\": \"interim\",\r\n    \"welcomeHeading\": \"Restrukturalizace\",\r\n    \"blocks\": [\r\n      {\r\n        \"heading\":\"Restrukturalizace společnosti\",\r\n        \"items\":[\r\n          {\r\n            \"subHeading\":\"Pro koho je určeno:\",\r\n            \"description\":\"věřitelé nebo&nbsp;vlastníci společnosti, která je&nbsp;schopna vydělat na&nbsp;udržení provozu ale&nbsp;nedokáže plnit své&nbsp;finanční&nbsp;závazky\"\r\n          },\r\n          {\r\n            \"subHeading\":\"Cíl:\",\r\n            \"description\":\"ve spolupráci s&nbsp;odbornými partnery ozdravit bilanci firmy tak, aby se&nbsp;mohla rozvíjet\"\r\n          }\r\n        ]\r\n      },\r\n      {\r\n        \"heading\":\"Krizový management\",\r\n        \"items\":[\r\n          {\r\n            \"subHeading\":\"Pro koho to je určeno: \",\r\n            \"description\":\"investoři společnosti, jíž se nedaří a&nbsp;nemá manažery se&nbsp;zkušenostmi s&nbsp;krizovým řízením\"\r\n          },\r\n          {\r\n            \"subHeading\":\"Cíl: \",\r\n            \"description\":\"udržet firmu v&nbsp;chodu, identifikovat příčinu problémů, najít a&nbsp;realizovat řešení\"\r\n          }\r\n        ]\r\n      },\r\n      {\r\n        \"heading\":\"Asistence insolvenčním správcům\",\r\n        \"items\":[\r\n          {\r\n            \"subHeading\":\"Pro koho to je určeno: \",\r\n            \"description\":\"insolvenční správci firem\"\r\n          },\r\n          {\r\n            \"subHeading\":\"Cíl: \",\r\n            \"description\":\"zajistit fungování firmy po&nbsp;dobu reorganizace nebo&nbsp;konkurzu, poskytnout potřebnou podporu pro&nbsp;výkon funkce insolvenčního správce\"\r\n          }\r\n        ]\r\n      }\r\n    ]\r\n  },\r\n  \"service_2\": {\r\n    \"code\": \"advisory\",\r\n    \"welcomeHeading\": \"Akviziční poradenství\",\r\n    \"blocks\": [\r\n      {\r\n        \"heading\":\"M&A asistence\",\r\n        \"items\":[\r\n          {\r\n            \"subHeading\":\"Pro koho je určeno:\",\r\n            \"description\":\"investor, který nemá vlastní akviziční tým\"\r\n          },\r\n          {\r\n            \"subHeading\":\"Cíl:\",\r\n            \"description\":\"úspěšně dokončit akvizici bez&nbsp;následných nemilých překvapení\"\r\n          }\r\n        ]\r\n      },\r\n      {\r\n        \"heading\":\"Postakviziční transformace\",\r\n        \"items\":[\r\n          {\r\n            \"subHeading\":\"Pro koho to je určeno: \",\r\n            \"description\":\"investor, který po&nbsp;akvizici nemá vhodného manažera a&nbsp;potřebuje zavést korporátní pravidla\"\r\n          },\r\n          {\r\n            \"subHeading\":\"Cíl: \",\r\n            \"description\":\"překlenout dobu do&nbsp;nástupu stabilního manažerského týmu, připravit firmu na&nbsp;řízení najatými manažery tak, aby&nbsp;vlastník nemusel řešit běžnou operativu\"\r\n          }\r\n        ]\r\n      }\r\n    ]\r\n  },\r\n\r\n  \"contact_heading\": \"Kontakt\",\r\n  \"contact_sendButton\": \"Odeslat\",\r\n  \"contact_managing_director\": \"Jednatel společnosti: Martin Ježek\",\r\n  \"contact_managing_director_linkedIn\": \"https://www.linkedin.com/in/martin-jezek-9818646/\",\r\n  \"contact_address_name\": \"TURNIMAN Advisory, s.r.o.\",\r\n  \"contact_address_address_1_row1\": \"Korunní 2569/108, Vinohrady\",\r\n  \"contact_address_address_1_row2\": \"101 00 Praha 10\",\r\n  \"contact_address_address_2_row1\": \"Kancelář: Hradešínská 37, Praha 10\",\r\n  \"contact_email\": \"email: info@turniman.eu\",\r\n  \"contact_dataMail\": \"Datová schránka: z2itund\",\r\n  \"contact_dic\": \"DIČ: CZ07825820\",\r\n  \"keyWords\": \"interim, poradenství, management, společnost, poradci, restrukturalizace, postakvizice, firma, finance, podnik, asistence, advisory, akvizice, transformace, odborné, Martin, Ježek \",\r\n  \"description\": \"TURNIMAN Advisory s.r.o. je firma která se zabývá interim managementem a odborným poradenstvím pro firmy a společnosti, které se dostali do jakých koliv potíží. Ať jim schází klíčový manažer nebo potřebují zvládnout akvizice. \",\r\n  \"backButton\": \"Zpět\"\r\n}\r\n', '2020-06-03 07:10:06', 0),
(2, 1, '{\r\n      \"lang\": \"xx\",\r\n      \"langLong\": \"template\",\r\n      \"menu\": [\"Our services\", \"About us\", \"Contact\"],\r\n      \"pages\": {\r\n        \"homepage\": {\r\n          \"code\": \"homepage\",\r\n          \"welcomeHeading\": \"Firma s dlouholetou praxí ve finančním a krizovém řízení nebo poradenství\",\r\n          \"welcomeSubHeading\": \"Nabízíme odborné služby pro vaši organizaci\",\r\n          \"welcomeLink\": \"Více o našich službách\",\r\n          \"aboutHeading\": \"O nás\",\r\n          \"aboutSubHeading\": \"Ing. Martin Ježek, FCCA\",\r\n          \"aboutDescription\": \"Zakladatel Martin se po přečtení životopisu Lee laccosy rozhodl, že jednou bude krizovým manažerem. Dnes má již dvacet let praxe ve finančním řízení a několik úspěšně zvládnutých interim management projektů.\",\r\n          \"ourServicesHeading\": \"Naše služby\",\r\n          \"redBlocks\": [\r\n            {\r\n              \"heading\": \"Interim management\",\r\n              \"code\": \"interim\",\r\n              \"items\": [\"první položka\", \"druhá položka\"]\r\n            },\r\n            {\r\n              \"heading\": \"Odborné poradenství\",\r\n              \"code\": \"advisory\",\r\n              \"items\": [\"první položka\", \"druhá položka\"]\r\n            }\r\n          ]\r\n        },\r\n        \"service_1\": {\r\n          \"code\": \"interim\",\r\n          \"welcomeHeading\": \"Interim management\",\r\n          \"blocks\": [\r\n            {\r\n              \"heading\": \"Substituční interim management\",\r\n              \"items\": [\r\n                {\r\n                  \"subHeading\": \"cíl\",\r\n                  \"description\": \"zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer\"\r\n                }\r\n              ]\r\n            }\r\n          ]\r\n        },\r\n        \"service_2\": {\r\n          \"code\": \"advisory\",\r\n          \"welcomeHeading\": \"odborné poradenství\",\r\n          \"blocks\": [\r\n            {\r\n              \"heading\": \"M/A asistence\",\r\n              \"items\": [\r\n                {\r\n                  \"subHeading\": \"Pro koho je určeno\",\r\n                  \"description\": \"zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer\"\r\n                },\r\n                {\r\n                  \"subHeading\": \"cíl\",\r\n                  \"description\": \"zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer\"\r\n                },\r\n                {\r\n                  \"subHeading\": \"Obvyklý rozsah\",\r\n                  \"description\": \"zajistit běžný chod firmy, dokud nebude nalezen a nenastoupí nový manažer\"\r\n                }\r\n              ]\r\n            }\r\n          ]\r\n        }\r\n        },\r\n      \"contact\": {\r\n        \"heading\": \"kontakt\",\r\n        \"address\": [\"nazev adresy\", \"adresa\", \"castPrahy + psč\"],\r\n        \"email\": \"Martin.Jezek@trunima.eu\",\r\n        \"dataBox\": \"Datová schránka: z48s8i\",\r\n        \"ico\": \"CZ885478\",\r\n        \"formItems\": {\r\n          \"name\": \"jméno\",\r\n          \"email\": \"email\",\r\n          \"subject\": \"predmet\",\r\n          \"text\": \"zpráva\"\r\n        },\r\n        \"sendButton\": \"Odeslat formulář\"\r\n      }\r\n    }', '2019-05-25 21:47:03', 1);

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `mutations`
--
ALTER TABLE `mutations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_commonRights_lang` (`lang_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `mutations`
--
ALTER TABLE `mutations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `mutations`
--
ALTER TABLE `mutations`
  ADD CONSTRAINT `FK_commonRights_lang` FOREIGN KEY (`lang_id`) REFERENCES `languages` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
