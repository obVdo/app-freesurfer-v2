<h1 align="center">recon-all-for-meeeg</h1>

<p align="center">
  Runs FreeSurfer 7.1.1 recon-all on a T1-weighted image to produce cortical surfaces and segmentation for MEG/EEG coregistration and BEM creation.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.898"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.898-blue.svg" alt="Run on brainlife.io"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Runs FreeSurfer 7.1.1 recon-all on a T1-weighted image to produce cortical surfaces and segmentation for MEG/EEG coregistration and BEM creation.**

Runs the full FreeSurfer recon-all pipeline (-all, parallel, 8 OpenMP threads) on the T1w image and outputs the subject directory. It is meant as the anatomy step of MEG/EEG pipelines, feeding coregistration and BEM Apps. No options are exposed (no hires, T2 or expert settings); expect many hours of compute and a FREESURFER_LICENSE or FS_LICENSE on the resource. The repository has no README.

| | |
|---|---|
| **Inputs** | `neuro/anat/t1w` |
| **Outputs** | `neuro/freesurfer` |
| **Container** | `brainlife/freesurfer:7.1.1` |
| **Resources** | 8 CPUs · 40 GB memory · 20 h walltime |
| **Requires** | `FREESURFER_LICENSE`, `FS_LICENSE` |
| **Run it** | [doi.org/10.25663/brainlife.app.898](https://doi.org/10.25663/brainlife.app.898) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `t1` | `neuro/anat/t1w` | yes | T1-weighted anatomical MRI for FreeSurfer recon-all surface reconstruction |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `output` | `neuro/freesurfer` | FreeSurfer recon-all output containing cortical surfaces and segmentation. Used as input for coregistration (app-coreg) and BEM model creation (app-bem). |

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.898](https://doi.org/10.25663/brainlife.app.898), choose `neuro/anat/t1w` from your project and press **Execute**. The results are saved to your project as `neuro/freesurfer`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `brainlife/freesurfer:7.1.1`), [`jq`](https://jqlang.github.io/jq/), `FREESURFER_LICENSE`, `FS_LICENSE`.

1. Clone this repository.
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "t1": "/path/to/t1/t1"
   }
   ```

3. Run `./main`.

## Troubleshooting

- **Please set FREESURFER_LICENSE or FS_LICENSE in resource environment**: Set FREESURFER_LICENSE (license text) or FS_LICENSE (path to license file) on the compute resource.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- recon-all-for-meeeg. brainlife.io App. [doi:10.25663/brainlife.app.898](https://doi.org/10.25663/brainlife.app.898)
- Fischl. FreeSurfer. *NeuroImage* 62:774-781 (2012). [doi:10.1016/j.neuroimage.2012.01.021](https://doi.org/10.1016/j.neuroimage.2012.01.021)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

Maintained by [@obVdo](https://github.com/obVdo).
