CREATE TABLE `employee` (
  `eid` varchar(255) NOT NULL,
  `permanentAddress` varchar(255) DEFAULT NULL,
  `residentialAddress` varchar(255) DEFAULT NULL,
  `birthdate` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `emailID` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `joiningDate` date DEFAULT NULL,
  `mobileNo` bigint DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`eid`),
  UNIQUE KEY `UK_ffkas881n8v979qh7ugkiik6r` (`emailID`),
  UNIQUE KEY `UK_knalytwo2nbim66os03bcb57s` (`mobileNo`)
);

CREATE TABLE `idgenerate` (
  `eid` int NOT NULL,
  `pid` int NOT NULL,
  PRIMARY KEY (`eid`)
);
--(manually add eid=0 pid=0 in IDGENERATE table)

CREATE TABLE `login` (
  `username` varchar(255) NOT NULL,
  `id` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
);
--(manually add one admin login in LOGIN table: 00111 administrator admin123 #[admin123] i.e. HASH of password)

CREATE TABLE `opd` (
  `opdId` int NOT NULL AUTO_INCREMENT,
  `doctorId` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `visitDate` date DEFAULT NULL,
  PRIMARY KEY (`opdId`),
  KEY `fk_pid` (`pid`),
  KEY `fk_doctorid` (`doctorId`),
  CONSTRAINT `fk_doctorid` FOREIGN KEY (`doctorId`) REFERENCES `employee` (`eid`),
  CONSTRAINT `fk_pid` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`)
);

CREATE TABLE `opddetails` (
  `opdid` int NOT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `donts` varchar(255) DEFAULT NULL,
  `dos` varchar(255) DEFAULT NULL,
  `fees` int NOT NULL,
  `followupDate` varchar(255) DEFAULT NULL,
  `investigations` varchar(255) DEFAULT NULL,
  `medicinesDose` varchar(255) DEFAULT NULL,
  `symptoms` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`opdid`),
  CONSTRAINT `fk_opdid` FOREIGN KEY (`opdid`) REFERENCES `opd` (`opdId`) ON DELETE CASCADE
);

CREATE TABLE `patient` (
  `pid` varchar(255) NOT NULL,
  `permanentAddress` varchar(255) DEFAULT NULL,
  `residentialAddress` varchar(255) DEFAULT NULL,
  `birthdate` varchar(255) DEFAULT NULL,
  `bloodGroup` varchar(255) DEFAULT NULL,
  `chronicDiseases` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `doctorId` varchar(255) DEFAULT NULL,
  `emailID` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `medicineAllergy` varchar(255) DEFAULT NULL,
  `mobileNo` bigint DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `registrationDate` date DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `UK_njgkc0r174ispixw8cwxsfyen` (`emailID`),
  UNIQUE KEY `UK_c6x5ynbam53c1rtgjw72fh3ck` (`mobileNo`),
  KEY `fk_assigned_doctorid` (`doctorId`),
  CONSTRAINT `fk_assigned_doctorid` FOREIGN KEY (`doctorId`) REFERENCES `employee` (`eid`)
);