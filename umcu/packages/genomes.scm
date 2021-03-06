;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2016, 2017 Roel Janssen <roel@gnu.org>
;;;
;;; This file is not officially part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (umcu packages genomes)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build utils)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages))

;; Ensembl provides the GRCh37 separated by chromosome.  This function
;; can be used as a template for each separate file.
(define (ensembl-grch37-dna-chromosome chromosome hash)
  (package
    (name (string-append "ensembl-grch37-dna-chr" chromosome))
    (version "88")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "ftp://ftp.ensembl.org/pub/grch37/release-" version "/fasta"
                    "/homo_sapiens/dna/Homo_sapiens.GRCh37.dna.chromosome"
                    "." chromosome ".fa.gz"))
              (sha256
               (base32 hash))))
    (build-system trivial-build-system)
   (arguments
    `(#:modules ((guix build utils))
      #:builder (begin
                  (use-modules (guix build utils))
                  (let ((genomes-dir (string-append
                                      %output "/share/genomes/ensembl"
                                      "/per-chromosome"))
                        (source (assoc-ref %build-inputs "source")))
                    (mkdir-p genomes-dir)
                    (copy-file source
                               (string-append
                                genomes-dir
                                "/Homo_sapiens.GRCh37.dna.chromosome."
                                ,chromosome ".fa.gz"))))))
   (native-inputs `(("source" ,source)))
   (home-page "http://www.ensembl.org")
   (synopsis (string-append
              "Genome Reference Consortium Human reference genome 37, "
              "chromosome " chromosome))
   (description (string-append
                 "This package contains the data for GRCh37 chromosome "
                 chromosome "."))
   ;; I couldn't find licensing information.
   (license #f)))

(define-public ensembl-grch37-dna-chromosome-1
  (ensembl-grch37-dna-chromosome
   "1" "15mbgahavid28ch4n0lnccdndg9dl4mhaq0dv3bmzc3qyag364rg"))

(define-public ensembl-grch37-dna-chromosome-2
  (ensembl-grch37-dna-chromosome
   "2" "0kp4d7asgmky8wa7pk9cn2fp49zyznq1zbabwl0hl66pj4gis4y4"))

(define-public ensembl-grch37-dna-chromosome-3
  (ensembl-grch37-dna-chromosome
   "3" "1hkffvs1mwlh34jnwnm8is7xaa826fw8zv1hx5mfkbnnn9n92sj0"))

(define-public ensembl-grch37-dna-chromosome-4
  (ensembl-grch37-dna-chromosome
   "4" "0c652i45n9bnz7xqhs9in7c08rmi3wy44398zh2d5p9iq13ysk34"))

(define-public ensembl-grch37-dna-chromosome-5
  (ensembl-grch37-dna-chromosome
   "5" "0bg86m9igrm744phwgvdmfgihf81jflarbv706vci4nrnqb7gsqi"))

(define-public ensembl-grch37-dna-chromosome-6
  (ensembl-grch37-dna-chromosome
   "6" "1zmsnfm9sjc21h4q4j4bjbmmaw3lj5nwzizgma1lwq68yhgm0bx5"))

(define-public ensembl-grch37-dna-chromosome-7
  (ensembl-grch37-dna-chromosome
   "7" "1mfjwrb27s6l57abs4cgcl90w7invdm9lg1j2z26ci5k01m0phhq"))

(define-public ensembl-grch37-dna-chromosome-8
  (ensembl-grch37-dna-chromosome
   "8" "1l0g83b3z2c1qla04prgcfwb5bcc7k9lwvcssvdg9p9kd5zxxjzq"))

(define-public ensembl-grch37-dna-chromosome-9
  (ensembl-grch37-dna-chromosome
   "9" "0k7kjhjasw9lshykdlga30cvc69nxaiah1d9hahhwk9zhdmjxbsx"))

(define-public ensembl-grch37-dna-chromosome-10
  (ensembl-grch37-dna-chromosome
   "10" "1420vyjspx3wbjnybz0nrh9aixg89k9xag3y1z5bhcb6s24js10q"))

(define-public ensembl-grch37-dna-chromosome-11
  (ensembl-grch37-dna-chromosome
   "11" "0cry7ln0j4k6c8adlxr1dw4x9pgkbi8nv61iysyjnwp2rd1zpbs4"))

(define-public ensembl-grch37-dna-chromosome-12
  (ensembl-grch37-dna-chromosome
   "12" "0iflw5c2y826wbb7gdhia94db3kz6n08nbbifihblfrb7181akji"))

(define-public ensembl-grch37-dna-chromosome-13
  (ensembl-grch37-dna-chromosome
   "13" "1x21y3arw9i2gm0wdbpv88sgjydrrdwrvrgf4ih4y83z64528iav"))

(define-public ensembl-grch37-dna-chromosome-14
  (ensembl-grch37-dna-chromosome
   "14" "0vfnvpbkg3s0b9d3r2bg493wlbiqxaa747zljx5sdsgh8ny8m142"))

(define-public ensembl-grch37-dna-chromosome-15
  (ensembl-grch37-dna-chromosome
   "15" "1xki8vz14ia95xf6w3qghybs76n5j0kn21871b9d0gy045lz4xlc"))

(define-public ensembl-grch37-dna-chromosome-16
  (ensembl-grch37-dna-chromosome
   "16" "1qn4qys9q945ia90q6g5nv8zhndx7yis692rznf2wyzglyagibhm"))

(define-public ensembl-grch37-dna-chromosome-17
  (ensembl-grch37-dna-chromosome
   "17" "0sjw1vj9hliyih7d18iigdfqzylp945aidsnf4h2424zcg7ininf"))

(define-public ensembl-grch37-dna-chromosome-18
  (ensembl-grch37-dna-chromosome
   "18" "0fis1pdjz4a996nd4l399d4sgnv7y33xd7i9f7l9vms56bg82i1d"))

(define-public ensembl-grch37-dna-chromosome-19
  (ensembl-grch37-dna-chromosome
   "19" "1c6xv1pwknqh48nc5yja5b4sc0b05a32q6hfp2q30zh6xv6y9b3g"))

(define-public ensembl-grch37-dna-chromosome-20
  (ensembl-grch37-dna-chromosome
   "20" "1h93w6lh5hgdz8dcfk8slw9khv3gri59dp5dsl2plw5xb4pava37"))

(define-public ensembl-grch37-dna-chromosome-21
  (ensembl-grch37-dna-chromosome
   "21" "16j7iqflirlf8kwargarijkmhsb4c9rh7l7agylp4amnvv7rlbir"))

(define-public ensembl-grch37-dna-chromosome-22
  (ensembl-grch37-dna-chromosome
   "22" "1xrlwaxig47nrnligasc5yw94yklm22dsg8zdj9kady0yd9dii52"))

(define-public ensembl-grch37-dna-chromosome-x
  (ensembl-grch37-dna-chromosome
   "X" "0apg4g2g1qh26f44a2brgcb3cwk59pbl9van5nwqxbkbgnb7m2yr"))

(define-public ensembl-grch37-dna-chromosome-y
  (ensembl-grch37-dna-chromosome
   "Y" "16gf1kipmns96dk7hz2mf6q2znd4d8kbjxd2cw45m71l6nirqr8n"))

(define-public ensembl-grch37-dna-chromosome-mt
  (ensembl-grch37-dna-chromosome
   "MT" "12pb4nv9nqzrwpbgllqlkl97f8ypawiqddrcnxrr2ziq91z25ngc"))


;; Ensembl provides the GRCh38 separated by chromosome.  This function
;; can be used as a template for each separate file.
(define (ensembl-grch38-dna-chromosome chromosome hash)
  (package
    (name (string-append "ensembl-grch38-dna-chr" chromosome))
    (version "88")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "ftp://ftp.ensembl.org/pub/release-" version "/fasta"
                    "/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.chromosome"
                    "." chromosome ".fa.gz"))
              (sha256
               (base32 hash))))
    (build-system trivial-build-system)
   (arguments
    `(#:modules ((guix build utils))
      #:builder (begin
                  (use-modules (guix build utils))
                  (let ((genomes-dir (string-append
                                      %output "/share/genomes/ensembl"
                                      "/per-chromosome"))
                        (source (assoc-ref %build-inputs "source")))
                    (mkdir-p genomes-dir)
                    (copy-file source
                               (string-append
                                genomes-dir
                                "/Homo_sapiens.GRCh38.dna.chromosome."
                                ,chromosome ".fa.gz"))))))
   (native-inputs `(("source" ,source)))
   (home-page "http://www.ensembl.org")
   (synopsis (string-append
              "Genome Reference Consortium Human reference genome 38, "
              "chromosome " chromosome))
   (description (string-append
                 "This package contains the data for GRCh38 chromosome "
                 chromosome "."))
   ;; I couldn't find licensing information.
   (license #f)))
   
(define-public ensembl-grch38-dna-chromosome-1
  (ensembl-grch38-dna-chromosome
   "1" "1cfc1dlwawhd8g4k8hw6450wibs84zmd8rj81hb5wgbnn06qxck8"))

(define-public ensembl-grch38-dna-chromosome-2
  (ensembl-grch38-dna-chromosome
   "2" "14453v8in8kkrhiffygimi15a7ibwzl8c7mkvf5chgh5657x2c7y"))

(define-public ensembl-grch38-dna-chromosome-3
  (ensembl-grch38-dna-chromosome
   "3" "03zk59qypqk11gs9masm8nmk23rgj1cggv3m47jhf8rf0qsra6vc"))

(define-public ensembl-grch38-dna-chromosome-4
  (ensembl-grch38-dna-chromosome
   "4" "098pvn4anlk9kp902zk6shbqzimqax2qqwyxzikvx2fcgs7aj7nh"))

(define-public ensembl-grch38-dna-chromosome-5
  (ensembl-grch38-dna-chromosome
   "5" "0mrmiwb76qpqm7swa6pfdwsqgdfp0kv01jjxwb3rzqv11shfxswv"))

(define-public ensembl-grch38-dna-chromosome-6
  (ensembl-grch38-dna-chromosome
   "6" "0wqcm9dpvb8gzjmxl07bg2k8nigq2g05563zyrzh5cv1m3sgc98w"))

(define-public ensembl-grch38-dna-chromosome-7
  (ensembl-grch38-dna-chromosome
   "7" "1pwd054bjg9nbnh0lhgw1786nz0j0zx17cz5karjhs4xwbfps0vx"))

(define-public ensembl-grch38-dna-chromosome-8
  (ensembl-grch38-dna-chromosome
   "8" "11qh05jsxqm7fcc4r614v81dhi4hx9v4l6wcl67w0hvnhi3qk4fn"))

(define-public ensembl-grch38-dna-chromosome-9
  (ensembl-grch38-dna-chromosome
   "9" "1y7hsj6mb50s7997iy8jraf74j799j2vn3pf4xx68x953hf6cgyb"))

(define-public ensembl-grch38-dna-chromosome-10
  (ensembl-grch38-dna-chromosome
   "10" "08yxkb7hlv70i6nbm7ndh0rlvxw6fmykxky89cfhnbw82zcnaa2j"))

(define-public ensembl-grch38-dna-chromosome-11
  (ensembl-grch38-dna-chromosome
   "11" "0pyh06c85g9yr4xv9m8ckvqv7q0xw3krjw669y006ram05xf9mq8"))

(define-public ensembl-grch38-dna-chromosome-12
  (ensembl-grch38-dna-chromosome
   "12" "0hvdlkpsmmxszyza6pi1i13p719rf5cj4rjlmnrjm4fjj86s87w4"))

(define-public ensembl-grch38-dna-chromosome-13
  (ensembl-grch38-dna-chromosome
   "13" "0x5fw9x2z87c2c7zs2xhgykqvf2p44p5c5d8aqqqc6x80zjjhvwq"))

(define-public ensembl-grch38-dna-chromosome-14
  (ensembl-grch38-dna-chromosome
   "14" "1xq3993zkjkb9jlrpkc8cmxalxkgldaav3jvig3mm6j819b0h4yj"))

(define-public ensembl-grch38-dna-chromosome-15
  (ensembl-grch38-dna-chromosome
   "15" "1f4irm483cgxllqck1ax7yfx3a7pnqxqxcald3ja5hmzsxghx4pn"))

(define-public ensembl-grch38-dna-chromosome-16
  (ensembl-grch38-dna-chromosome
   "16" "1y0zpjwxvcz7pabi0qwrqi05iipgpdn1rvl1rmynm7idaxrhp5bi"))

(define-public ensembl-grch38-dna-chromosome-17
  (ensembl-grch38-dna-chromosome
   "17" "0l73l44b4a44s3qbd6hidvdynmgmhznzc2raffvg172zbl6wnlgq"))

(define-public ensembl-grch38-dna-chromosome-18
  (ensembl-grch38-dna-chromosome
   "18" "1yzlr2707qvpv5mhmsiv50kcansfaxnbd4giaars5sk7ilwwai6i"))

(define-public ensembl-grch38-dna-chromosome-19
  (ensembl-grch38-dna-chromosome
   "19" "12d8g93y27xhav8mm8gslp48jrkiya9fn36jjq18xkqbj971ilm6"))

(define-public ensembl-grch38-dna-chromosome-20
  (ensembl-grch38-dna-chromosome
   "20" "00d8j47i72ii54xjgnpyv2pryyxr69b7rd3sb1h7i7yhwkw3spsa"))

(define-public ensembl-grch38-dna-chromosome-21
  (ensembl-grch38-dna-chromosome
   "21" "1rnfhsr81wg9p98mcfk8mqr9frhvir3b787zi0dw20y2iyagabhz"))

(define-public ensembl-grch38-dna-chromosome-22
  (ensembl-grch38-dna-chromosome
   "22" "1bqpy3zp2fpwzisrvs31rmjl845sd8n2jimfil2jiz0bzih7k55w"))

(define-public ensembl-grch38-dna-chromosome-x
  (ensembl-grch38-dna-chromosome
   "X" "0mdclb5zhl2kcjzrgm4bbpa96wg9h3a5352b6snsck900jdav13s"))

(define-public ensembl-grch38-dna-chromosome-y
  (ensembl-grch38-dna-chromosome
   "Y" "0lgddp73jpi6a8bnjnjn5pba4cd01vfrlxkhl5bk62shvl92621x"))

(define-public ensembl-grch38-dna-chromosome-mt
  (ensembl-grch38-dna-chromosome
   "MT" "0f9gy1aqracnpqpvdyx99nkkac2gkm3sap5k2naxjpw35r4yms10"))
