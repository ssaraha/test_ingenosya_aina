<?php

namespace App\Entity;

use App\Repository\CodepostalRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

use App\Entity\Traits\Timetrait;

/**
 * @ORM\Entity(repositoryClass=CodepostalRepository::class)
 * @ORM\Table(name="codepostales")
 * @ORM\HasLifecycleCallbacks
 */
class Codepostal
{

    use Timetrait;
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $codepostal;

    /**
     * @ORM\OneToMany(targetEntity=Societe::class, mappedBy="codepostal")
     */
    private $societes;

    /**
     * @ORM\OneToMany(targetEntity=Ville::class, mappedBy="codepostal")
     */
    private $villes;

    public function __construct()
    {
        $this->societes = new ArrayCollection();
        $this->villes = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCodepostal(): ?string
    {
        return $this->codepostal;
    }

    public function setCodepostal(string $codepostal): self
    {
        $this->codepostal = $codepostal;

        return $this;
    }

    /**
     * @return Collection|Societe[]
     */
    public function getSocietes(): Collection
    {
        return $this->societes;
    }

    public function addSociete(Societe $societe): self
    {
        if (!$this->societes->contains($societe)) {
            $this->societes[] = $societe;
            $societe->setCodepostal($this);
        }

        return $this;
    }

    public function removeSociete(Societe $societe): self
    {
        if ($this->societes->removeElement($societe)) {
            // set the owning side to null (unless already changed)
            if ($societe->getCodepostal() === $this) {
                $societe->setCodepostal(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Ville[]
     */
    public function getVilles(): Collection
    {
        return $this->villes;
    }

    public function addVille(Ville $ville): self
    {
        if (!$this->villes->contains($ville)) {
            $this->villes[] = $ville;
            $ville->setCodepostal($this);
        }

        return $this;
    }

    public function removeVille(Ville $ville): self
    {
        if ($this->villes->removeElement($ville)) {
            // set the owning side to null (unless already changed)
            if ($ville->getCodepostal() === $this) {
                $ville->setCodepostal(null);
            }
        }

        return $this;
    }

    public function __toString() {
        return $this->codepostal;
    }
}
