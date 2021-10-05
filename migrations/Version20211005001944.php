<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211005001944 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE societe_type_societe (societe_id INT NOT NULL, type_societe_id INT NOT NULL, INDEX IDX_FB9E3F15FCF77503 (societe_id), INDEX IDX_FB9E3F15E1F4A326 (type_societe_id), PRIMARY KEY(societe_id, type_societe_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE societe_type_societe ADD CONSTRAINT FK_FB9E3F15FCF77503 FOREIGN KEY (societe_id) REFERENCES societes (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE societe_type_societe ADD CONSTRAINT FK_FB9E3F15E1F4A326 FOREIGN KEY (type_societe_id) REFERENCES typesocietes (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE societes ADD codepostal_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE societes ADD CONSTRAINT FK_AEC76507C9B1D722 FOREIGN KEY (codepostal_id) REFERENCES codepostales (id)');
        $this->addSql('CREATE INDEX IDX_AEC76507C9B1D722 ON societes (codepostal_id)');
        $this->addSql('ALTER TABLE villes ADD codepostal_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE villes ADD CONSTRAINT FK_19209FD8C9B1D722 FOREIGN KEY (codepostal_id) REFERENCES codepostales (id)');
        $this->addSql('CREATE INDEX IDX_19209FD8C9B1D722 ON villes (codepostal_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE societe_type_societe');
        $this->addSql('ALTER TABLE societes DROP FOREIGN KEY FK_AEC76507C9B1D722');
        $this->addSql('DROP INDEX IDX_AEC76507C9B1D722 ON societes');
        $this->addSql('ALTER TABLE societes DROP codepostal_id');
        $this->addSql('ALTER TABLE villes DROP FOREIGN KEY FK_19209FD8C9B1D722');
        $this->addSql('DROP INDEX IDX_19209FD8C9B1D722 ON villes');
        $this->addSql('ALTER TABLE villes DROP codepostal_id');
    }
}
