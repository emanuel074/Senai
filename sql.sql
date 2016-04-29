CREATE DATABASE bancoteste;
USE bancoteste;

CREATE TABLE candidato (
  codCandidato INT NOT NULL AUTO_INCREMENT,
  
  legenda INT(10) NOT NULL,
  
  nome VARCHAR(100) NOT NULL,
 
  turma VARCHAR(100) NOT NULL,
  

  PRIMARY KEY(codCandidato)
)Engine=InnoDB;

CREATE TABLE endereco (
  codEndereco INT NOT NULL AUTO_INCREMENT,
  idCliente INT NOT NULL,
  turma VARCHAR(100) NOT NULL,
  PRIMARY KEY(codEndereco),
  FOREIGN KEY(idCliente) REFERENCES candidato(codCandidato)
)Engine=InnoDB;


/* Mudando o delimitador de comandos, para que possamos utilizar
  o ;(ponto e virgula) no final de cada linha em nossa procedure
*/
DELIMITER $$


DROP PROCEDURE IF EXISTS `spInsere` $$



CREATE PROCEDURE `spInsere`(IN legenda INT(10),IN nome VARCHAR(100), IN turma VARCHAR(20))

BEGIN

  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;


  IF (nome <> "" AND turma <> "") THEN
    START TRANSACTION;

   
    INSERT INTO candidato VALUES(null,legenda,nome,turma);

   
    IF excessao = 1
    THEN
      SELECT 'Erro ao inserir na tabela cliente' AS Msg;
      ROLLBACK;
    ELSE
     
      SELECT DISTINCT LAST_INSERT_ID() INTO @idCliente FROM candidato;
     
      IF excessao = 1
      THEN
        SELECT 'Erro ao selecionar o ultim ID inserido' AS Msg;
        ROLLBACK;
      ELSE
       
  


        INSERT INTO endereco VALUES(null, @idCliente, turma);
        
        IF excessao = 1
        THEN
          SELECT 'Erro ao inserir na tabela  endereco' AS Msg;
          ROLLBACK;
        ELSE
          
			

           SELECT 'Cadastro efetuado com sucesso' AS Msg;
          COMMIT;
        END IF;
      END IF;
    END IF;


  ELSE
    
    SELECT 'Parametros necessarios' AS Msg;
  END IF;


END $$

/* procedure que Pesquisar o Candidato Pela Legenda
*/
DELIMITER ;

DROP PROCEDURE IF EXISTS `spCandidato` 

DELIMITER $$
 CREATE PROCEDURE spCandidato(IN legend INT)
 BEGIN
 SELECT legenda,nome,turma
 FROM candidato
 where legend =legenda;
 END
 $$ DELIMITER ;




DROP PROCEDURE IF EXISTS `sp_Candidato_UPDATE` 
DELIMITER $$
CREATE PROCEDURE sp_Candidato_UPDATE
     (
        IN  u_nome                   varchar(100), 
        IN  u_turma                   varchar(100)    
     )
BEGIN 

    UPDATE candidato
    SET    
          u_nome  = nome                    
    WHERE  u_turma = turma ; 

END 

$$ DELIMITER ;







DROP PROCEDURE IF EXISTS `sp_candidato_DELETE` 
DELIMITER $$

CREATE PROCEDURE sp_candidato_DELETE
     (
        IN  legenda_id  INT(10) 
     )
BEGIN 

    DELETE FROM candidato
    WHERE  legenda_id = legenda ; 

END 

$$ DELIMITER ;


